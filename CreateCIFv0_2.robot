***Settings***
Library    Selenium2Library  run_on_failure=Nothing
Library    String
Library    FakerLibrary   locale=th_TH    seed=None   providers=None
# Library    Split String    string, separator=None, max_split=-1

***Variables***
${browser}    chrome
###############################Select the ENV you want.###############################################
# ${url5}       https://cdx-dit-pci-kong-clb.dev.depthcon1.com/mobius
${url5}       https://cdx-sit-pci-kong-clb.dev.depthcon1.com/mobius
# ${url5}       https://kong-sit3-pci-clb.int-np.cardx.co.th/mobius
# ${url5}       https://kong-sit2-pci-clb.int-np.cardx.co.th/mobius

${STLaserNo}  TH
${mail}  mobius
${lastmail}  @mobius.org
@{Occupation}  31  44  26  34  72  85  91  82  10  23  41  21  103  81  02  36  01  100  60  53  56  20  54  57  51  55  50  33  70  40  22  45  12  18  92  83  24  42  46  47  102  15  32  104  48  71  00  06  05  30  04  13  11  16  101   
# ${test}  xpath://input[@tabindex='-1'] 
${CHROME_DRIVER_PATH_WINS}    ${EXECDIR}${/}resources${/}drivers${/}win32${/}chromedriver.exe    # windows chromedriver_85 version.85 path
${CHROME_DRIVER_PATH_MAC}     ${EXECDIR}${/}resources${/}drivers${/}mac64${/}chromedriver.exe    # mac chromedriver_85 version.85 path
${CHROME_DRIVER_PATH_LINUX}   /usr/local/bin/chromedriver



*** Tasks ***
open mobius
    Open Chrome Browser  ${url5}  
    maximize Browser window
    Wait Until Element Is Visible    xpath://input[@id='submitButton']    60
    Click Button  id=submitButton
Login 
    Input Text  name=userID  99361CIM02
    Click Button  id=submitBtn
    Input Text  name=opensesame  mobius
    sleep  1
    Click Button  id=submitBtn  
    sleep  2
    ${secpassList1}=  Get Element Attribute    xpath://input[@id='secpassList1']    tabindex
    ${secpassList2}=  Get Element Attribute    xpath://input[@id='secpassList2']    tabindex
    ${secpassList3}=  Get Element Attribute    xpath://input[@id='secpassList3']    tabindex
    ${secpassList4}=  Get Element Attribute    xpath://input[@id='secpassList4']    tabindex
    ${secpassList5}=  Get Element Attribute    xpath://input[@id='secpassList5']    tabindex
    ${secpassList6}=  Get Element Attribute    xpath://input[@id='secpassList6']    tabindex  
    IF    ${secpassList1} == None
        Input Text  id=secpassList1  A
    END
    IF    ${secpassList2} == None
        Input Text  id=secpassList2  b
    END
    IF    ${secpassList3} == None
        Input Text  id=secpassList3  1
    END
    IF    ${secpassList4} == None
        Input Text  id=secpassList4  1
    END
    IF    ${secpassList5} == None
        Input Text  id=secpassList5  1
    END
    IF    ${secpassList6} == None
        Input Text  id=secpassList6  1
    END
    sleep  0.5
    Click Button   id=authenticateBtn
    Wait Until Element Is Visible    xpath://a[text()='Customer']    60  
    # ${str}=  Get Element Attribute  xpath://div[1]/div/div[2]/div[1]  for    
    # log To Consol  ${str}
    # # IF  xpath://input[@tabindex='-1']
    # #     log To Console   "test"
    # # END
Click Customer 
    Click Link   xpath://a[text()='Customer']
    sleep  4
Click Customer 360    
    #SIT3
    # Click Link   xpath://a[@href='/cciiCustomerMaster/list?_original=/cciiCustomerMaster/list']

    #UAT2
    # Click Link   xpath://a[@href='/owiOUfTQ5nGk7JYK0MYn5Ikyt70_2ilwPuuw8MuJkH8']
    Click Link   xpath://*[@data-id='CCII_CUSTOMER_PROFILE']
    sleep  3
Calculate
    TRY
        WHILE   True   limit=100
            ${NUMBER1}=    Set Variable  ${3}
            ${NUMBER2}=    Set Variable  ${1}
            ${NUMBER3}=    Set Variable  ${0}
            ${NUMBER4}=    Generate Random String    1    [NUMBERS]
            ${NUMBER5}=    Generate Random String    1    [NUMBERS]
            ${NUMBER6}=    Generate Random String    1    [NUMBERS]
            ${NUMBER7}=    Generate Random String    1    [NUMBERS]
            ${NUMBER8}=    Generate Random String    1    [NUMBERS]
            ${NUMBER9}=    Generate Random String    1    [NUMBERS]
            ${NUMBER10}=    Generate Random String    1    [NUMBERS]
            ${NUMBER11}=    Generate Random String    1    [NUMBERS]
            ${NUMBER12}=    Generate Random String    1    [NUMBERS]
            ${NUMBER13}=    Generate Random String    1    [NUMBERS]

            ${SUM}=  Set Variable  ${${NUMBER1}*13+ ${NUMBER2}*12+ ${${NUMBER3}*11} + ${${NUMBER4}*10}+ ${${NUMBER5}*9}+ ${${NUMBER6}*8}+ ${${NUMBER7}*7}+ ${${NUMBER8}*6}+ ${${NUMBER9}*5}+ ${${NUMBER10}*4}+ ${${NUMBER11}*3}+ ${${NUMBER12}*2}}
            ${SUMMOD}=  Set Variable  ${${SUM} % ${11}}
            # log To Console   ${SUM}
            IF  ${SUMMOD} > 0 and ${SUMMOD} > 1
                ${LASTNUM}=  Set Variable  ${${11} - ${SUMMOD}}
                # log To Console   ${SUM}
                # log To Console   ${SUMMOD}
                # log To Console   ${LASTNUM}
                # log To Console   ${NUMBER1}${NUMBER2}${NUMBER3}${NUMBER4}${NUMBER5}${NUMBER6}${NUMBER7}${NUMBER8}${NUMBER9}${NUMBER10}${NUMBER11}${NUMBER12}${LASTNUM}
                ${idNumber}=  Set Variable  ${NUMBER1}${NUMBER2}${NUMBER3}${NUMBER4}${NUMBER5}${NUMBER6}${NUMBER7}${NUMBER8}${NUMBER9}${NUMBER10}${NUMBER11}${NUMBER12}${LASTNUM}
                Wait Until Element Is Visible    xpath://a[@id="addBtn"]    60
                Click Link  xpath://a[@id='addBtn']
                Wait Until Element Is Visible    xpath://a[@id='nextBtn']    60
                Click Link  xpath://a[@id='nextBtn']
                Wait Until Element Is Visible    xpath://a[label='Search and Filter']    60
                Click Link  xpath://a[label='Search and Filter']
                
                sleep  1
                ${name1}=    FakerLibrary.FirstName
                ${lastname1}=    FakerLibrary.LastName
                # Input Text  name=obCciiCustomerMasterNameDetail.customerName  ${namethai1}     # ชื่อไทย
                # Input Text  name=obCciiCustomerMasterNameDetail.lastName  ${lastnamethai1}          # นามสกุลไทย
                # Scroll Element Into View   xpath://input[@id="idNumber"]
                Execute JavaScript   window.scrollTo(0,3000)
                Sleep  3
                
                Wait Until Element Is Visible    xpath://input[@id='customerName']    60

                Input Text  name=obCciiCustomerMasterNameDetail.customerName  ${name1}     
                Input Text  name=obCciiCustomerMasterNameDetail.lastName  ${lastname1}          
                Input Text  name=dateOfBirthIncorporation  1-01-1951              
                
                Input Text  id=idNumber   ${idNumber}                               # เลขบัตรปชช.
                Select From List By Value  constitution  21

                Wait Until Element Is Visible    xpath://select[@id="idType"]/option[@value="P1"]    60
                Select From List By Value  idType  P1
                sleep  1

                Click Link  xpath://a[@id='toTopBtn'] 
                sleep  3 

                Click Link  xpath://a[@id='searchBtn']
                Wait Until Element Is Visible    xpath://a[@id='addBtn']    60
                Click Link  xpath://a[@id='addBtn']
                
                Wait Until Element Is Visible    xpath://select[@id="title"]/option[@value="KHUN"]    60
                Select From List By Value  title  KHUN
                Select From List By Value  engTitle  KHUN
                # sleep  0.5
                Input Text  id=engFirstName  ${name1}     # FIRSTNAME  
                # sleep  0.5
                Input Text  id=engLastName  ${lastname1}         # LASTNAME
                Wait Until Element Is Visible    xpath://select[@id="residentBusinessOperationCountry"]/option[@value="TH"]    60
                Select From List By Value  residentBusinessOperationCountry  TH
                Wait Until Element Is Visible    xpath://select[@id="gender"]/option[@value="U"]    60
                Select From List By Value  gender  U
                # sleep  1
                ${RANDOM_NUMBER}=    Generate Random String    10    [NUMBERS]
                Input Text  id=idCardLaserNo  ${STLaserNo}${RANDOM_NUMBER}    
                # sleep  0.5
                Input Text  id=idIssueDate  05-09-2022
                # sleep  0.5
                Input Text  id=idExpiryDate  05-09-2048
                Wait Until Element Is Visible    xpath://select[@id="preferredLanguage"]/option[@value="TH"]    60
                Select From List By Value  preferredLanguage  TH
                Wait Until Element Is Visible    xpath://select[@id="maritalStatus"]/option[@value="U"]    60
                Select From List By Value  maritalStatus  U
                Wait Until Element Is Visible    xpath://select[@id="addressType"]/option[@value="H"]    60
                Select From List By Value  addressType  H
                # sleep  0.5
                Input Text  id=address1  123/2
                # sleep  0.5
                Input Text  id=address2  MOBIUS
                Input Text  id=address3  5
                Select From List By Value  cidProvince  BKK
                Wait Until Element Is Visible    xpath://select[@id="cidDistrict"]/option[@value="DIN_DAENG"]    60
                Select From List By Value  cidDistrict  DIN_DAENG
                Wait Until Element Is Visible    xpath://select[@id="cidSubDistrict"]/option[@value="DIN_DAENG"]    60
                Select From List By Value  cidSubDistrict  DIN_DAENG
                Wait Until Element Is Visible    xpath://select[@id="cidPostcode"]/option[@value="10400"]    60
                Select From List By Value  cidPostcode  10400

                ########Salary (SA)
                ########Self Employed (SE)
                Select From List By Value  employmentType  SA  #Employment Type

                ${value}=  Evaluate  random.choice($Occupation)  random
                Select From List By Value  occupation  ${value}

                ${RANDOM_Income}=    Generate Random String    1    [NUMBERS]
                Input Text  id=grossMonthlyIncome  2${RANDOM_Income}00000     #Monthly Income ,if u want to changed monthly income u should additanol 2 zero after u desired salary.

                Input Text  id=employerAddress1  212/2
                Input Text  id=employerAddress3  2
                Input Text  id=employerAddress5  1
                Select From List By Value  employerAddressProvince  BKK
                Wait Until Element Is Visible    xpath://select[@id="employerAddressDistrict"]/option[@value="DIN_DAENG"]    60
                Select From List By Value  employerAddressDistrict  DIN_DAENG
                Wait Until Element Is Visible    xpath://select[@id="employerAddressSubDistrict"]/option[@value="DIN_DAENG"]    60
                Select From List By Value  employerAddressSubDistrict  DIN_DAENG
                Wait Until Element Is Visible    xpath://select[@id="employerAddressPostCode"]/option[@value="10400"]    60
                Select From List By Value  employerAddressPostCode  10400

                ${RANDOM_TEL}=    Generate Random String    9    [NUMBERS]
                ${RANDOM_mail}=    Generate Random String    6    [NUMBERS]
                Select From List By Value  mailingCode  0000000000
                sleep  0.5
                Select From List By Value  marketingMailingCode  0000000000
                sleep  0.5
                Select From List By Value  mobileAreaCode  89 
                sleep  0.5
                Input Text  id=mobileEcontactDetail  ${RANDOM_TEL}         
                sleep  0.5
                Input Text  id=emailEcontactDetail  ${mail}${RANDOM_mail}${lastmail}    
                sleep  0.5

                Select From List By label  subVipCode  None
                ##Employee of CardX(SX)
                ##Employee of SCB(SE)
                ##Employee of SCB Affiliates(SS)
                Select From List By Value  staffGrade  SX   #Staff Grade
                sleep  0.5
                Click Link  xpath://a[@id='toTopBtn']    
                sleep  3
                # Wait Until Element Is Visible    xpath://a[@id="nextBtn"]    60
                Click Link  xpath://a[@id='nextBtn']
                Wait Until Element Is Visible    xpath://a[@id="saveBtn"]    60
                Click Link  xpath://a[@id='saveBtn']
                log To Console    ${idNumber}
                Wait Until Element Is Visible    xpath://a[@id="backBtn"]    60
                # ${Text}=  Get Text    xpath://div[@class='sub-message']
                # ${TextArray}=    Split String From Right    ${Text}  Reference Number |
                # ${NUMBER1}=    Set Variable  ${TextArray}[1]  

                # log To Console   ${NUMBER1}
                # ${RefNo}=  Get Text    xpath://div[@id="cciiCustomerMasterForm"]
                # log To Console    ${result}
                Click Link  xpath://a[@id='backBtn']
                sleep  3
            END 
        END
    EXCEPT    WHILE loop was aborted    type=start
        Log    The loop did not finish within the limit.
    Close Browser
    END    




*** Keywords ***
Open Chrome Browser
    [Documentation]    Open Chrome Browser and go to page.
    ...    \n| Open Chrome Browser And Go To Page | ${url} |
    [Arguments]    ${url}
    ${system}=    Evaluate    platform.system()    platform
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method  ${chrome_options}  add_experimental_option    useAutomationExtension    ${False}
    Call Method  ${chrome_options}  add_argument  test-type
    Call Method  ${chrome_options}  add_argument  ignore-certificate-errors
    Call Method  ${chrome_options}  add_argument  --disable-gpu
    Call Method  ${chrome_options}  add_argument  --no-sandbox
    ${prefs} =    Create Dictionary    download.prompt_for_download=${true}    safebrowsing.enabled=${false}
    call method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Run Keyword If    '${system}'=='Linux'    Run Keywords
    ...    Call Method    ${chrome_options}    add_argument    test-type
    ...    AND    Call Method    ${chrome_options}    add_argument    ignore-certificate-errors
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-extensions
    ...    AND    Call Method    ${chrome_options}    add_argument    --headless
    ...    AND    Call Method    ${chrome_options}    add_argument    --disable-gpu
    ...    AND    Call Method    ${chrome_options}    add_argument    --no-sandbox
    ${driver_path}=    Run Keyword If    '${system}'=='Linux'    Set Variable    ${CHROME_DRIVER_PATH_LINUX}
    ...    ELSE IF    '${system}'=='Windows'  Set Variable    ${CHROME_DRIVER_PATH_WINS}
    ...    ELSE IF    '${system}'=='Darwin'   Set Variable    ${CHROME_DRIVER_PATH_MAC}
    ...    ELSE     fail    Not support system : ${system}
    ${kwargs}=    BuiltIn.Create Dictionary    executable_path=${driver_path}
    Create Webdriver    Chrome    chrome_options=${chrome_options}    kwargs=${kwargs}
    Run Keyword If    '${system}'=='Windows'    Maximize Browser Window
    Set Selenium Speed    0.2 seconds
    Go To    ${url}