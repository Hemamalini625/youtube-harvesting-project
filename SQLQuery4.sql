


declare @json_data varchar(max)

select @json_data = BulkColumn

from openrowset

(
	BULK 'C:\Users\Hema Chandran\Desktop\python trial\youtube proj\channel_list.json ' , SINGLE_CLOB

) as datasource

print @json_data
select * from openjson(@json_data)
WITH
(
	ch_name varchar(20),
	ch_desc varchar(20),
	ch_join date,
	
	subscriber int ,
	vi_count int,
	playlist_id varchar(20),
	video_ids varchar(20),
	viewer int
	
)
insert into emp2( emp2_ch_name, emp2_ch_desc, emp2_ch_join,emp2_subscriber,emp2_vi_count,emp2_playlist_id,emp2_video_ids,emp2_viewer)
select ch_name,ch_desc,ch_join,subscriber,vi_count,playlist_id,video_ids,viewer from openjson (@json_data)
WITH
(

	ch_name varchar(20),
	ch_desc varchar(20),
	ch_join date,
	subscriber int ,
	vi_count int,
	playlist_id varchar(20),
	video_ids varchar(20),
	viewer int

)