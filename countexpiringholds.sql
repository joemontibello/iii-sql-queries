--Counts the number of holds that expire today.
--Presumably, once the holdshelf is cleared and items that
--expire are checked in, this number should be zero.

SELECT COUNT(*) from 
sierra_view.hold
WHERE
to_char(now(), 'YYYY-MM-DD') = to_char(expires_gmt, 'YYYY-MM-DD')
