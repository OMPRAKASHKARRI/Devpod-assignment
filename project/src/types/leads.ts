export interface Lead {
  id: string;
  name: string;
  contact_person: string | null;
  email: string | null;
  phone: string | null;
  status: 'new' | 'contacted' | 'qualified' | 'proposal' | 'negotiation' | 'won' | 'lost';
  source: 'website' | 'referral' | 'social_media' | 'direct' | 'other';
  notes: string | null;
  expected_value: number;
  assigned_to: string | null;
  created_at: string;
  updated_at: string;
  created_by: string;
}

export interface LeadFormData {
  name: string;
  contact_person?: string;
  email?: string;
  phone?: string;
  status: Lead['status'];
  source: Lead['source'];
  notes?: string;
  expected_value?: number;
  assigned_to?: string;
}