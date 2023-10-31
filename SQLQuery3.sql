

declare @json_data varchar(max)

select @json_data = BulkColumn

from openrowset

(
	BULK 'C:\Users\Hema Chandran\Desktop\python trial\youtube proj\youtube_project.videoslist.json ' , SINGLE_CLOB

) as datasource

print @json_data
select * from openjson(@json_data)
WITH
(
	video_title varchar(20),
	published date,
	viewcount int,
	comment_ct int ,
	likecount int
	
)