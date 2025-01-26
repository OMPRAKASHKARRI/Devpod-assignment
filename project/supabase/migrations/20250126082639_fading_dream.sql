/*
  # Initial Schema for Leads Management

  1. New Tables
    - `leads`
      - `id` (uuid, primary key)
      - `name` (text) - Lead/Company name
      - `contact_person` (text) - Primary contact person
      - `email` (text)
      - `phone` (text)
      - `status` (text) - new, contacted, qualified, proposal, negotiation, won, lost
      - `source` (text) - website, referral, social_media, direct, other
      - `notes` (text)
      - `expected_value` (numeric)
      - `assigned_to` (uuid) - Reference to users table
      - `created_at` (timestamptz)
      - `updated_at` (timestamptz)
      - `created_by` (uuid) - Reference to users table
    
  2. Security
    - Enable RLS on leads table
    - Add policies for:
      - Users can view leads assigned to them
      - Managers can view all leads
      - Only assigned users and managers can update leads
*/

CREATE TABLE IF NOT EXISTS leads (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  contact_person text,
  email text,
  phone text,
  status text NOT NULL DEFAULT 'new',
  source text NOT NULL DEFAULT 'direct',
  notes text,
  expected_value numeric DEFAULT 0,
  assigned_to uuid REFERENCES auth.users(id),
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now(),
  created_by uuid REFERENCES auth.users(id)
);

-- Enable RLS
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;

-- Create policies
CREATE POLICY "Users can view assigned leads"
  ON leads
  FOR SELECT
  USING (
    auth.uid() = assigned_to OR
    auth.uid() IN (
      SELECT id FROM auth.users 
      WHERE raw_user_meta_data->>'role' IN ('manager', 'admin', 'superadmin')
    )
  );

CREATE POLICY "Users can update assigned leads"
  ON leads
  FOR UPDATE
  USING (
    auth.uid() = assigned_to OR
    auth.uid() IN (
      SELECT id FROM auth.users 
      WHERE raw_user_meta_data->>'role' IN ('manager', 'admin', 'superadmin')
    )
  );

CREATE POLICY "Users can create leads"
  ON leads
  FOR INSERT
  WITH CHECK (true);

-- Create indexes
CREATE INDEX IF NOT EXISTS idx_leads_assigned_to ON leads(assigned_to);
CREATE INDEX IF NOT EXISTS idx_leads_status ON leads(status);
CREATE INDEX IF NOT EXISTS idx_leads_created_at ON leads(created_at);