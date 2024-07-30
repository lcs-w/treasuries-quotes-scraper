*** Settings ***
Library    Browser
Library    String
Library    OperatingSystem
# Library    datetime_coverter.py
# Library    ${EXECDIR}/datetime_coverter.py
Library    ${CURDIR}/datetime_coverter.py

 
*** Variables ***
${url}    https://www.wsj.com/market-data/bonds/treasuries

*** Test Cases ***
0. get_quotes
    [Tags]    scraper
    New Browser    headless=False
    New Context
    New Page    url=${url}
    ${table}=    Get Text    xpath=//table[1]  # Assuming it's the first table on the page
    ${last_update}=    Get Text    xpath=//*[@id="root"]/div/div/div/div[2]/div/div/div[2]/div/div/span     
    # copied from inspect moded (Copy XPath)
    ${last_update}=    datetime_coverter.to_datetime_str    ${last_update}
    Create File    ${EXECDIR}/data//treasuries_${last_update}.txt    ${table}
    Close Browser
    
    