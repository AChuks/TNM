export const parseDate = (date) => {
    let videoRawDate = new Date(date);
    const monthNames = ["Jan", "Feb", "March", "April", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"];
    var curr_date = videoRawDate.getDate();
    var curr_month = monthNames[videoRawDate.getMonth()]; 
    var curr_year = videoRawDate.getFullYear();
    return curr_month + ' ' + curr_date + ',' + ' ' + curr_year;
}
