function LinkFormatter(value, row, index) {
  var val = "";
  if (value) {
    val = value;
  } else {
    val = row.id;
  }
  return "<a href='jobs/" + row.id + "'>" + val + "</a>";
}
function UserLinkFormatter(value, row, index) {
  return "<a href='users/" + row.id + "'>" + value + "</a>";
}
function WorkOrderLinkFormatter(value, row, index) {
  return "<a href='jobs/" + row.job_id + "/work_orders/" + row.id + "'>" + value + "</a>";
}
function JobLinkFormatter(value, row, index) {
  var val = "";
  if (value) {
    val = value;
  } else {
    val = row.id;
  }
  return "<a href='jobs/" + row.job_id +"'>" + val + "</a>";
}
function WorkOrderAcknowledge(value, row, index) {
  if (row.acknowledgement == true) {
    return "Work Order Acknolwedged"
  } else {
    return "<a href='jobs/" + row.job_id +"/work_orders/" + row.id + "/acknolwedge'>Acknolwedge Work Order</a>";
  }
}
