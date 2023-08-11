***Settings***
Library    Selenium2Library  run_on_failure=Nothing
Library    String
# Library    FakerLibrary   locale=th_TH    seed=None   providers=None
Library    OperatingSystem 


***Variables***
${browser}    chrome
# ${url5}       https://cdx-dit-pci-kong-clb.dev.depthcon1.com/mobius
${url5}       https://cdx-sit-pci-kong-clb.dev.depthcon1.com/mobius
# ${url5}       https://kong-uat2-pci-clb.int-np.cardx.co.th/mobius
# ${url5}       https://kong-sit3-pci-clb.int-np.cardx.co.th/mobius
# ${url5}       https://sit.cardx.aliyun.sdecloud.tech/mobius
${CHROME_DRIVER_PATH_WINS}    ${EXECDIR}${/}resources${/}drivers${/}win32${/}chromedriver.exe    # windows chromedriver_85 version.85 path
${CHROME_DRIVER_PATH_MAC}     ${EXECDIR}${/}resources${/}drivers${/}mac64${/}chromedriver.exe    # mac chromedriver_85 version.85 path
${CHROME_DRIVER_PATH_LINUX}   /usr/local/bin/chromedriver

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

*** Tasks ***
open mobius
    Open Chrome Browser  ${url5} 
    maximize Browser window
    # sleep  10
    Wait Until Element Is Visible    xpath://*[@id='submitButton']    60 
    Click Button  id=submitButton
Login 
    Input Text  name=userID  99361CIC15  
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
    Wait Until Element Is Visible    xpath://a[text()='Tasks']    60 
    # ${str}=  Get Element Attribute  xpath://div[1]/div/div[2]/div[1]  for    
    # log To Consol  ${str}
    # # IF  xpath://input[@tabindex='-1']
    # #     log To Console   "test"
    # # END
Click Customer 
    TRY
        ${x}=    Set Variable    ${0}
        WHILE   True   limit=none
            Click Link   xpath://a[text()='Tasks']
            Wait Until Element Is Visible    xpath://*[@data-id='MY_TASK']    60  
            Click Link   xpath://*[@data-id='MY_TASK']
            Wait Until Element Is Visible    class=odd    60  
            Click Element   class=odd 
            # sleep  5
            # Wait Until Element Is Visible    xpath://*[contains(text(), "Task History")]    60 
            # Scroll Element Into View  xpath://*[contains(text(), "Task History")]
            Execute JavaScript   window.scrollTo(0,3000)
            
            Wait Until Element Is Visible    xpath://a[@id='btnProceed']    60 
            # sleep 10
            Click Link   xpath://a[@id='btnProceed']

            Wait Until Element Is Visible    xpath://select[@id="action"]/option[@value="approve"]    60
            Select From List By Value  action  approve 

            # Wait Until Element Is Visible    id=submitBtn    60 
            # Scroll Element Into View   id=submitBtn
            sleep  2
            Execute JavaScript   window.scrollTo(616, 3317)
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
            sleep  2
            Click Button    id=submitBtn 
            sleep  5
            Wait Until Element Is Visible  class=selected
            Click Element   class=selected
            Wait Until Element Is Visible   xpath://*[@data-id='GROUP_TASK']  60  
            Click Link   xpath://*[@data-id='MY_TASK']

            ${x}=    Evaluate    ${x} + 1
            log To Console  ${x}
        END
    EXCEPT    WHILE loop was aborted    type=start
        Log    The loop did not finish within the limit.
    Close Browser
    END    