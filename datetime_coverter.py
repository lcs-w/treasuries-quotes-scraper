from datetime import datetime

def to_datetime_str(source_dt: str):
    datetime_strp = datetime.strptime(source_dt, "%A, %B %d, %Y")
    datetime_strf = datetime.strftime(datetime_strp, "%Y%m%d")
    return datetime_strf


if __name__ == "__main__":
    print(to_datetime_str("Monday, July 15, 2024"))