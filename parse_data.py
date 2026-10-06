import json
import re

csv_data = """PARTNERS,TOTAL,,AU FINAL,,AXIS  FINAL,,AXIS LIC 21-SEP,,HDFC FINAL,,INDUS FINAL,,SBI FINAL,,TATA NEU FINAL,,KIWI-SEP,,BOB FINAL,,YES ZAGGLE FINAL,,RBL FINAL,
,LMT,CMT,LM,CM,LM,CM,LM,CM,LM,CM,LM,CM,LM,CM,LM,CM,LM,CM,LM,CM,LM,CM,LM,CM
INAYA,9595,12351,44,58,161,329,16,2,836,1613,87,54,1080,759,5198,5428,1,0,2137,3917,35,86,0,105
 AZAM,141,339,0,0,0,0,0,0,2,7,0,0,0,0,136,324,0,0,3,8,0,0,0,0
DALEE,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
EASYCREDIT FINSERV,139,332,0,0,0,0,0,0,0,0,0,0,0,0,136,324,0,0,3,8,0,0,0,0
SHAHDAT ALI,0,5,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0
SUNIL YADAV,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
SHUBHAM SHRIVASTAV,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
INAYA,3430,2932,0,0,0,0,0,0,260,154,0,0,0,0,3170,2757,0,0,0,21,0,0,0,0
POONAM KAMBLE,1356,985,0,0,0,0,0,0,259,154,0,0,0,0,1097,831,0,0,0,0,0,0,0,0
SANVIKA CREDIT ADVISORY,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
AIM ENTERPRISES,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD,2073,1947,0,0,0,0,0,0,0,0,0,0,0,0,2073,1926,0,0,0,21,0,0,0,0
BHAVANI,1344,2279,5,5,46,81,1,0,71,104,2,4,34,47,13,16,0,0,1169,2011,3,5,0,6
RUDRA,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
ANIKET,0,8,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
ANJANI PANDEY,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0
G K TRADERS,2,17,0,0,0,4,0,0,0,1,0,0,0,7,0,0,0,0,2,5,0,0,0,0
BALAJI ENTERPRISES,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
BALAJI SOLUTIONS WORK,51,104,0,0,0,0,0,0,3,0,1,0,0,4,0,0,0,0,47,98,0,0,0,2
HIRDESH,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
HASMAT,18,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,18,11,0,0,0,0
AED19 CARD SERVICES PVT LTD,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0
PRUDENTS,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0
SHIVAM,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0
INFINITY ENTERPRISES,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
QUANTUMX GLOBAL PRIVATE LIMITED,169,544,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,168,543,0,0,0,0
RAHUL KUMAR MISHRA,127,277,1,1,36,36,0,0,7,9,0,0,19,25,0,0,0,0,64,206,0,0,0,0
SHAKSHI,369,262,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,368,259,0,0,0,2
VISHAL SHARMA,275,417,0,0,7,17,0,0,46,47,0,3,1,3,0,0,0,0,221,347,0,0,0,0
TYAGI INFOSIS,13,11,0,0,0,0,0,0,11,11,0,0,0,0,2,0,0,0,0,0,0,0,0,0
SHIVANSHIENTERPRISES,0,4,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0
EXTRA,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
NEERAJ KUMAR,48,94,3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,45,89,0,0,0,2
JAI JAGANNATH CARDS SERVICES PRIVATE LIMITED,169,275,0,0,0,0,0,0,0,10,0,0,0,0,11,14,0,0,158,251,0,0,0,0
RIYA,13,8,0,0,0,0,0,0,0,0,0,0,13,8,0,0,0,0,0,0,0,0,0,0
SHILPA,21,51,1,1,2,13,0,0,3,7,0,0,0,0,0,0,0,0,13,25,2,5,0,0
SUNIL,0,16,0,0,0,0,0,0,0,14,0,0,0,0,0,2,0,0,0,0,0,0,0,0
SANJAY PATEL,64,35,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,64,32,0,0,0,0
SNEHA SHARMA,2,139,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,139,0,0,0,0
BINOD MISHRA,640,1108,36,50,47,62,0,0,32,34,8,9,1,5,251,460,0,0,245,391,20,39,0,58
BISHAL PAUL,62,3,0,0,0,0,0,0,10,2,0,0,0,0,0,0,0,0,50,1,2,0,0,0
ABHIPAY,145,426,0,0,0,0,0,0,0,0,0,0,0,0,145,425,0,0,0,1,0,0,0,0
PROSENJIT CHATERJEE,100,200,0,0,0,0,0,0,0,3,2,1,0,0,5,0,0,0,91,180,2,2,0,14
FUNDCAP,0,13,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,12,0,0,0,0
EXTRA,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
PARTHA BHATTACHARJEE,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0
GROWUP FINANCIAL,2,1,0,0,1,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0
AMIT KUMAR,19,22,0,0,7,5,0,0,0,2,0,1,0,0,2,3,0,0,10,11,0,0,0,0
SUDIP POUL,39,99,0,10,17,23,0,0,1,4,0,0,0,0,0,0,0,0,19,48,2,3,0,11
S K RABI,0,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0
RR ASSOCIATES,172,166,35,40,13,16,0,0,13,14,6,7,1,5,83,19,0,0,19,53,2,3,0,9
SRABANTI PAUL,62,73,0,0,9,16,0,0,2,7,0,0,0,0,5,3,0,0,45,46,1,1,0,0
SECUREPEAK SERVICE PVT LTD,39,88,1,0,0,1,0,0,6,2,0,0,0,0,10,8,0,0,11,23,11,30,0,24
DIVYAM,547,874,3,1,3,7,0,0,26,39,17,10,122,139,299,525,1,0,75,153,1,0,0,0
ATIK AHMED ,16,13,2,0,0,0,0,0,8,4,2,6,0,3,0,0,1,0,3,0,0,0,0,0
OWLOTS NEXTGEN PRIVATE LIMITED,76,148,0,0,0,0,0,0,0,0,12,4,3,4,0,0,0,0,61,140,0,0,0,0
AMIT KUMAR,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
ABHISHEK,0,3,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0
HETAL,9,11,0,0,0,0,0,0,0,0,0,0,9,11,0,0,0,0,0,0,0,0,0,0
ASHISH JANI,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
GAJENDRA,279,521,0,0,0,0,0,0,0,0,0,0,0,0,279,521,0,0,0,0,0,0,0,0
FAIZAL,115,128,0,0,2,7,0,0,2,0,1,0,110,121,0,0,0,0,0,0,0,0,0,0
VIKRAM PUNE,20,4,0,0,0,0,0,0,0,0,0,0,0,0,20,4,0,0,0,0,0,0,0,0
INTROSPECT FINANCIAL SERVICE,14,32,0,0,0,0,0,0,14,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0
VIKAS D,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0
EXTRA,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0
MESHIYA HETALBEN TARUNKUMAR,0,11,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,0,0,0,0
MILI PRADHAN,14,1,1,0,1,0,0,0,2,0,2,0,0,0,0,0,0,0,8,1,0,0,0,0
ANSH MANAGEMENT,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
VINAY PANDEY,1880,2166,0,1,44,149,12,0,157,294,46,27,917,559,263,214,0,0,435,880,6,30,0,12
VINEET SHARMA,4,7,0,0,0,0,0,0,1,3,0,0,3,0,0,0,0,0,0,4,0,0,0,0
RIDHVIK FINANCIAL SERVICES,113,293,0,0,0,3,0,0,0,0,8,0,0,0,36,18,0,0,69,272,0,0,0,0
AYUSH,5,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0
EXTRA,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
PRIYA CHAND,0,1,0,0,0,0,0,0,0,0,2,1,0,0,0,0,0,0,0,0,0,0,0,0
AKSH CHOUHAN,0,48,0,0,0,0,0,0,0,0,0,0,73,48,0,0,0,0,0,0,0,0,0,0
KRISHNA,9,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,9,5,0,0,0,0
UNIQE MONEY,0,49,0,0,0,0,0,0,0,0,0,0,0,49,0,0,0,0,0,0,0,0,0,0
ABHISHEK DUTTA,0,2,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0
FARMAN,19,14,0,0,0,0,0,0,7,12,0,0,12,0,0,2,0,0,0,0,0,0,0,0
SWATI,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0
IMRAN,9,4,0,0,0,0,0,0,0,0,9,4,0,0,0,0,0,0,0,0,0,0,0,0
SUNITA (BOOSTER SCORE SOLUTIONS PVT LTD),243,187,0,0,11,10,0,0,33,55,1,1,0,0,198,119,0,0,0,0,0,0,0,2
ANUBHAV GUPTA,98,78,0,0,0,0,0,0,0,17,0,0,98,61,0,0,0,0,0,0,0,0,0,0
SNEHLATA,0,41,0,0,0,0,0,0,0,0,0,0,0,41,0,0,0,0,0,0,0,0,0,0
FINSPARK,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
ARUN KUMAR,88,82,0,0,0,11,0,0,0,0,0,0,88,71,0,0,0,0,0,0,0,0,0,0
ARMAN RANJAN,7,10,0,0,0,0,0,0,0,0,0,0,7,10,0,0,0,0,0,0,0,0,0,0
BHARAT ENTERPRISES (PATHWAY SOLUTION),222,393,0,0,0,33,12,0,8,94,3,7,170,145,2,2,0,0,27,112,0,0,0,0
CAPITAL CALL SERVICE,2,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0
CARDS EXPERTS,19,93,0,0,0,66,0,0,7,0,0,0,12,25,0,0,0,0,0,2,0,0,0,0
DEBSTER MEDIA PRIVATE LIMITED,3,3,0,0,0,0,0,0,0,0,3,3,0,0,0,0,0,0,0,0,0,0,0,0
ARPAN TYAGI ,0,6,0,0,0,0,0,0,0,0,0,0,0,6,0,0,0,0,0,0,0,0,0,0
KHUSHBOO SINGH,50,15,0,0,0,0,0,0,0,0,0,1,50,14,0,0,0,0,0,0,0,0,0,0
RAHUL,0,25,0,0,0,2,0,0,0,0,0,0,1,18,0,0,0,0,0,5,0,0,0,0
AMIT KUMAR SHARMA,120,87,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,120,87,0,0,0,0
MONEY MART,7,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7,12,0,0,0,0
NEHA SAINI,16,18,0,0,0,0,0,0,0,0,0,0,16,18,0,0,0,0,0,0,0,0,0,0
S & P FINANCIAL SOLUTIONS,51,68,0,0,0,4,0,0,3,8,0,0,8,15,0,1,0,0,40,40,0,0,0,0
SUKRITI MANDAL,76,0,0,0,0,0,0,0,0,0,0,0,76,0,0,0,0,0,0,0,0,0,0,0
SANJAY SAINI,58,51,0,1,19,20,0,0,12,13,4,1,9,10,0,0,0,0,14,6,0,0,0,0
TEJPAL SINGH,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
SKY HEIGHTS OUTSOURCING SOLUTIONS,111,161,0,0,0,0,0,0,86,92,0,0,0,0,25,69,0,0,0,0,0,0,0,0
PREETAM,4,13,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,13,0,0,0,0
RN CARD EXPERTISE PRIVATE LIMITED ,113,0,0,0,0,0,0,0,0,0,0,0,113,0,0,0,0,0,0,0,0,0,0,0
ZAHID,38,18,0,0,0,0,0,0,0,0,0,0,38,18,0,0,0,0,0,0,0,0,0,0
VIKAS,140,7,0,0,0,0,0,0,0,0,0,0,140,7,0,0,0,0,0,0,0,0,0,0
VARSHA RANI,48,44,0,0,0,0,0,0,0,0,0,0,3,1,0,0,0,0,45,43,0,0,0,0
SANTOSH KUMAR SHARMA,2,21,0,0,0,0,0,0,0,0,0,0,0,0,2,3,0,0,0,18,0,0,0,0
SHRESHREY CARD SERVICES PRIVATE LIMITED,6,30,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,30,0,0
UMA SINGH ( SHIVI CARDS SERVICES),119,274,0,0,14,0,0,0,0,0,5,2,0,1,0,0,0,0,100,261,0,0,0,10
RUPI BAZAAR FINTECH PVT LTD,4,5,0,0,0,0,0,0,0,0,4,5,0,0,0,0,0,0,0,0,0,0,0,0
ALKESH SHUKLA,78,58,0,1,6,1,0,0,66,42,2,0,3,0,0,6,0,0,1,8,0,0,0,0
ABHISHEK CHANYAL,0,20,0,0,0,0,0,0,0,13,0,0,0,0,0,5,0,0,0,2,0,0,0,0
MADHU YADAV,1,3,0,1,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0
RITU SHUKLA,31,33,0,0,0,0,0,0,26,26,2,0,3,0,0,1,0,0,0,6,0,0,0,0
ZAINAB NADEEM,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0
UPENDRA KUMAR SINGH,6,1,0,0,6,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
VIJAY RASTOGI,2,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
VIPIN KUMAR TIWARI,35,1,0,0,0,0,0,0,35,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0
ZEESHAN HAIDER,1535,2595,0,0,15,29,3,2,222,939,12,4,3,9,1066,1126,0,0,209,445,5,12,0,29
ZEESHAN ,99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,99,0,0,0,0,0
AFSANA BEGUM/AMIRUL,4,33,0,0,0,3,0,0,4,26,0,0,0,0,0,0,0,0,0,4,0,0,0,0
ADVENTURIA THRILL INDIA PRIVATE LIMITED,96,151,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,96,147,0,1,0,3
CREDITLO BUSINESS SOLUTIONS,11,25,0,0,0,0,0,0,0,0,0,0,0,0,6,20,0,0,5,5,0,0,0,0
SALEEM,668,1803,0,0,0,0,0,0,204,885,0,0,0,0,464,918,0,0,0,0,0,0,0,0
EXTRA,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CREDBAE,2,1,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0
BHUVNESH,0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,0,0,0,0
SWATI (ZEESHAN),0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0
LAKSHAY RATHORE,2,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0
GULREZ,5,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
I DOOR WEALTH MENAGMENT ,6,16,0,0,4,11,0,0,0,2,0,0,0,3,2,0,0,0,0,0,0,0,0,0
GB ENTERPRISE,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0
FARHAD,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
TELERING PROCESS PVT LTD,640,554,0,0,10,15,3,2,8,26,10,4,3,6,594,188,0,0,7,276,5,11,0,26
GRAND TOTAL,9595,12351,44,58,161,329,16,2,836,1613,87,54,1080,759,5198,5428,1,0,2137,3917,35,86,0,105
"""

# Let's inspect managers and their channel partners
known_managers = [
    "AZAM",
    "INAYA",
    "BHAVANI",
    "BINOD MISHRA",
    "DIVYAM",
    "VINAY PANDEY",
    "ALKESH SHUKLA",
    "ZEESHAN HAIDER"
]

banks = [
    "AU", "AXIS", "AXIS LIC", "HDFC", "INDUS", "SBI", "TATA NEU", "KIWI", "BOB", "YES ZAGGLE", "RBL"
]

bank_keys = [
    "au", "axis", "axis_lic", "hdfc", "indus", "sbi", "tata_neu", "kiwi", "bob", "yes_zaggle", "rbl"
]

lines = [line.strip() for line in csv_data.strip().split("\n") if line.strip()]

rows = []
for line in lines[2:]:
    parts = line.split(",")
    name = parts[0].strip()
    if not name:
        continue
    if name == "GRAND TOTAL":
        break
    nums = [int(p) if p.isdigit() else 0 for p in parts[1:25]]
    rows.append((name, nums))

print(f"Total rows parsed: {len(rows)}")

# Group by manager
manager_groups = []
current_mgr = None

for name, nums in rows:
    # Check if this name is a manager header
    # Let's check matching known_managers
    is_mgr = False
    for km in known_managers:
        if name == km or name == km + " ":
            is_mgr = True
            break
    
    if is_mgr:
        current_mgr = {
            "manager_name": name,
            "partners": []
        }
        manager_groups.append(current_mgr)
    else:
        if current_mgr is None:
            # First group
            current_mgr = {
                "manager_name": "HEAD OFFICE / GENERAL",
                "partners": []
            }
            manager_groups.append(current_mgr)
        
        partner_obj = {
            "name": name,
            "lmt": nums[0] if len(nums) > 0 else 0,
            "cmt": nums[1] if len(nums) > 1 else 0,
            "banks": {}
        }
        for i, b_key in enumerate(bank_keys):
            lm_idx = 2 + i * 2
            cm_idx = 3 + i * 2
            partner_obj["banks"][b_key] = {
                "lm": nums[lm_idx] if len(nums) > lm_idx else 0,
                "cm": nums[cm_idx] if len(nums) > cm_idx else 0,
            }
        current_mgr["partners"].append(partner_obj)

print("Managers identified:")
for g in manager_groups:
    print(f"- Manager: {g['manager_name']} ({len(g['partners'])} partners)")

# Working capital and partner profiles
working_capital_data = {
    "CAPITAL CALL SERVICES": 904650,
    "BALAJI ENTERPRISES": 131448,
    "MONEY MART": 67566,
    "SHRESHREY CARD SERVICES PVT LTD": 618200,
    "ANSH MANAGEMENT": 82919,
    "Q GET FINANCIAL TECHNOLOGIES INDIA PVT LTD": 2876727,
    "UPENDRA KUMAR SINGH": 86576,
    "SANJAY PATEL": 0,
    "TYAGI INFOSIS": 133773,
    "AED19 CARD SERVICES PVT LTD": 650391
}

bank_statuses = {
    "HDFC": "FINAL",
    "TATA NEU": "FINAL",
    "SBI": "FINAL",
    "AXIS LIC": "21-SEP",
    "AXIS": "FINAL",
    "AU": "FINAL",
    "BOB": "FINAL",
    "INDUS": "FINAL",
    "YES ZAGGLE": "FINAL",
    "RBL": "FINAL"
}

data_export = {
    "title": "Credit Card Issuance & Partner Performance Portal",
    "last_month_name": "August 2026",
    "current_month_name": "September 2026",
    "banks": [
        {"id": "au", "name": "AU", "status": "FINAL"},
        {"id": "axis", "name": "AXIS", "status": "FINAL"},
        {"id": "axis_lic", "name": "AXIS LIC", "status": "21-SEP"},
        {"id": "hdfc", "name": "HDFC", "status": "FINAL"},
        {"id": "indus", "name": "INDUS", "status": "FINAL"},
        {"id": "sbi", "name": "SBI", "status": "FINAL"},
        {"id": "tata_neu", "name": "TATA NEU", "status": "FINAL"},
        {"id": "kiwi", "name": "KIWI", "status": "FINAL"},
        {"id": "bob", "name": "BOB", "status": "FINAL"},
        {"id": "yes_zaggle", "name": "YES ZAGGLE", "status": "FINAL"},
        {"id": "rbl", "name": "RBL", "status": "FINAL"}
    ],
    "managers": manager_groups,
    "working_capital": working_capital_data,
    "bank_statuses": bank_statuses
}

with open("initial_data.json", "w", encoding="utf-8") as f:
    json.dump(data_export, f, indent=2)

print("Saved initial_data.json successfully!")
