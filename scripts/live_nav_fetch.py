import os
import requests
import pandas as pd

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
BASE_DIR = os.path.dirname(SCRIPT_DIR)
OUTPUT_DIR = os.path.join(BASE_DIR, "data", "raw")
os.makedirs(OUTPUT_DIR, exist_ok=True)

SCHEMES = {
    "125497": "HDFC_Top_100_Direct",
    "119551": "SBI_Bluechip",
    "120503": "ICICI_Bluechip",
    "118632": "Nippon_Large_Cap",
    "119092": "Axis_Bluechip",
    "120841": "Kotak_Bluechip"
}

def execute_ingestion():
    print("?? Running clean production real-time fetch script...")
    print(f"?? Output Folder: {OUTPUT_DIR}\n")
    
    for code, name in SCHEMES.items():
        url = "https://api.mfapi.in/mf/" + str(code)
        print(f"?? Requesting: {url}")
        
        try:
            response = requests.get(url, timeout=12)
            if response.status_code == 200:
                json_data = response.json()
                nav_records = json_data.get('data', [])
                
                df_live = pd.DataFrame(nav_records)
                if not df_live.empty:
                    df_live['scheme_code'] = code
                    df_live['scheme_name'] = name
                    df_live = df_live[['scheme_code', 'scheme_name', 'date', 'nav']]
                    
                    file_name = f"live_nav_{code}_{name.lower()}.csv"
                    df_live.to_csv(os.path.join(OUTPUT_DIR, file_name), index=False)
                    print(f"? Success: Downloaded {len(df_live)} rows.")
                else:
                    print(f"?? Empty dataset for {code}")
            else:
                print(f"? Server Connection Error: HTTP {response.status_code}")
        except Exception as error:
            print(f"? Connection pipeline failure: {error}")
        print("-" * 55)

if __name__ == "__main__":
    execute_ingestion()
