/*CREATE SCHEMA AND STAGES*/
USE ROLE ST_DEMO_ROLE;
/*SWTICH DB AND WAREHOUSE*/
USE DATABASE STREAMLIT_DB;
USE WAREHOUSE STREAMLIT_XS_WH;
/*SWITCH TO SCHEMA*/
USE SCHEMA STREAMLIT_STAGES;
/*CREATE STAGE WITH DIRECTORY*/
CREATE STAGE STG_NOAA_WEATHER
    DIRECTORY = (ENABLE=TRUE);
/*USE APPS SCHEMA*/
USE SCHEMA STREAMLIT_APPS;

/*CREATE STREAMLIT APP*/
CREATE STREAMLIT NOAA_WEATHER_STATIONS
    ROOT_LOCATION = '@STREAMLIT_DB.STREAMLIT_STAGES.STG_NOAA_WEATHER'
    MAIN_FILE = 'noaa_weather_stations.py'
    QUERY_WAREHOUSE = STREAMLIT_XS_WH
    COMMENT = 'Display Location of NOAA Weather Stations';
	
/*GRANT PRIVILEGES TO APP USERS ROLE TO RUN APP*/
USE SCHEMA STREAMLIT_DB.STREAMLIT_APPS;
GRANT USAGE ON STREAMLIT NOAA_WEATHER_STATIONS TO ROLE ST_APP_USERS;
