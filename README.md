# Passport-Stamp-Query-API

NodeJS API to interact with Gitcoin Passport Data<br>
<hr>

### Requirements
- [Install latest NodeJS](https://nodejs.org/en/) Tested with v16.15.1 and higher
- [Install latest yarn](https://classic.yarnpkg.com/lang/en/docs/install) Tested with 1.22.19 and higher
<hr>

### Installation Steps
- Clone this repo 
- Enter into the repo directory
- Run `./install.sh`
- Start the API using `./startAPI.sh`
- Test the API by visiting<br>
	`http://127.0.0.1:3000/verify?address=0x4cff229ef59e9615d12196a4ceff3f0f663e652d`
- You can also suply a ceramic node URL (Optional)<br>
	`http://127.0.0.1:3000/verify?address=0x4cff229ef59e9615d12196a4ceff3f0f663e652d&node=https://ceramic.passport-iam.gitcoin.co`
<hr>

### R Client
The R code to use the API and get the passport data in a nice and clean format can be found in `consumeAPI.R`
<hr>

- `Calling API from Web Browser`
<img src="man/figures/screen_browser.png"  align="center"/>
<hr>

- `Testing API using a JS Script`
<img src="man/figures/screen_js.png"  align="center"/>
<hr>

- `Using example R code to use the API and get data in a clean format`
<img src="man/figures/screen_r.png"  align="center"/>
