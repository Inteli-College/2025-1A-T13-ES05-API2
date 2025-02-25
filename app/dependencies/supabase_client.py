import os
from supabase import create_client, Client
from dotenv import load_dotenv
from fastapi import Depends

load_dotenv()

def get_supabase_client():
    url = os.getenv("SUPABASE_URL")
    key = os.getenv("SUPABASE_KEY")
    return create_client(url, key)