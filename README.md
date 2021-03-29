# README

## JOB DOC

This project runs a stock exchange web scrapper.
Uses for default this site to scrap: https://br.advfn.com/bolsa-de-valores/bovespa/banco-do-brasil-on-BBAS3/cotacao.
And scrapping this fields:
![image](https://user-images.githubusercontent.com/12386264/112871139-51b0cc00-9095-11eb-8184-f1c61f19768b.png)

After scrapping finished, create a json file with this structure:

![image](https://user-images.githubusercontent.com/12386264/112871380-99375800-9095-11eb-9429-750dbf729149.png)

If you run again, he will add a new object with the job execution datetime, ex:

![image](https://user-images.githubusercontent.com/12386264/112871559-bf5cf800-9095-11eb-8132-899ec9ca2d92.png)

## Technologies
* Ruby 2.5.1+

Clone project and follow the next steps.

## Install and execute

**1. Environment Dependencies**

- Ruby: we recommend to use some version manager like [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv) 

**2. Installation**

	bundle install
	
**3. Run scraper**

Inside of the project, run:
```
  ruby execute.rb
```
If you want to change url or the data path update the execute.rb file changing the **url** and **path** params.	
## Tests
	
To run the tests:

	ruby scraper_test.rb

## Improvements
- Add a new way of storing data, such csv or a database.
- Add a script with a time to run this job.
- Create a API if it's necessary.
- Add more tests.
