--It looks like the id2reckey function requires elevated privileges.
--Pass in the bib and item record numbers.
--A hold has been found if this returns one or more record numbers.

SELECT id2reckey(hold.record_id)

FROM
sierra_view.hold,
sierra_view.bib_record_item_record_link

WHERE 
(hold.record_id = bib_record_item_record_link.bib_record_id -- hold on the bib
OR
hold.record_id = bib_record_item_record_link.item_record_id) -- hold on the item)
AND (hold.record_id = reckey2id('b5283024')
    OR hold.record_id = reckey2id('i4266312'))