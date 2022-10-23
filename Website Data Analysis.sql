

select utm_content,count(distinct Website_session_id) as Sessions
from website_sessions
where Website_session_id  between 1000 and 2000
group by utm_content
order by count(distinct Website_session_id) desc ;


select * from Website_sessions limit 1000;

/* Session_to_Order_Conversion */

select website_sessions.utm_content, 
count(distinct website_sessions.Website_session_id) as Sessions, 
count(distinct orders.order_id),
count(distinct orders.order_id)/count(distinct website_sessions.Website_session_id) as Session_to_Ord_Conv
from website_sessions left join orders on website_sessions.Website_session_id = orders.Website_session_id 
where website_sessions.Website_session_id between 1000 and 2000
group by 1
order by 2 desc;

/* Top Traffic Sources */

select utm_source,utm_campaign,http_referer ,count(distinct website_session_id) as Sessions from website_sessions 
where created_at< '2012-04-12'
group by utm_source,utm_campaign,http_referer 
order by 4 DESC;

/* Sessions_to_Order_Conv */

select count(distinct website_sessions.website_session_id) as Sessions ,
count(distinct orders.order_id) as Orders, 
count(distinct orders.order_id) /  count(distinct website_sessions.website_session_id) as Sessions_to_Order_Conv
from website_sessions  left join orders 
on website_sessions.website_session_id = orders.website_session_id
where website_sessions.utm_source='gsearch' and website_sessions.utm_campaign='nonbrand' and website_sessions.created_at< '2012-04-14';

select * from website_sessions;
select * from Orders;

/* Traffic Source Trending */
select min(date(created_at))as week_start_date, count(distinct website_session_id) as sessions
from
website_sessions where created_at<'2012-05-10' and utm_source='gsearch' and utm_campaign='nonbrand' 
group by year(created_at), week(created_at);

/* Conv_rate */

select  website_sessions.device_type,
count(distinct website_sessions.website_session_id),
count(distinct orders.order_id),
count(distinct orders.order_id)/count(distinct website_sessions.website_session_id) as Conv_rate
from website_sessions left join orders on website_sessions.website_session_id = orders.website_session_id
where website_sessions.created_at<'2012-05-11' group by 1;

/* mob desktop sessions */

select min(date(created_at)),
count(distinct case when device_type='desktop' then website_session_id else NULL end) as desktop,
count(distinct case when device_type='mobile' then website_session_id  else Null end )as Mobile,
count(distinct website_session_id) as total_sessions
from website_sessions
where created_at <'2012-06-12'
group by year(created_at), week(created_at);


/* website */

select * from website_pageviews;

select pageview_url,count(distinct website_pageview_id) as sessions 
from website_pageviews where created_at <'2012-06-09'
group by pageview_url
order by 2 desc;










