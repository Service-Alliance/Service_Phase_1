function ContactLinkFormatter(value, row, index) {
  return "<a href='/contacts/" + row.id + "'>" + value + "</a>";
}
function FranchiseLinkFormatter(value, row, index) {
  return "<a href='/franchises/" + row.id + "'>" + value + "</a>";
}
function InsuranceCompanyLinkFormatter(value, row, index) {
  return "<a href='/insurance_companies/" + row.id + "'>" + value + "</a>";
}
function UserLinkFormatter(value, row, index) {
  return "<a href='/users/" + row.id + "'>" + value + "</a>";
}
function WorkOrderLinkFormatter(value, row, index) {
  return "<a href='/jobs/" + row.job_id + "/work_orders/" + row.id + "'>" + value + "</a>";
}
function VendorLinkFormatter(value, row, index) {
  return "<a href='/vendors/" + row.id + "'>" + value + "</a>";
}
function UploadLinkFormatter(value, row, index) {
  return "<a href='" + value + "'>View/Download</a>";
}
function DeleteUpload(value, row, index) {
  return "<a data-method='delete' data-confirm='Are you sure?' href='/jobs/<%= @job.id %>/uploads/" + row.id + "'>Delete</a>";
}
function CallLinkFormatter(value, row, index) {
  return "<a target='_blank' href='/calls/" + row.id + "'>" + value + "</a>";
}
function JobLinkFormatter(value, row, index) {
  var job_id = row.job_id === undefined ? row.id : row.job_id;
  var val = "";
  if (value) {
    val = value;
  } else {
    val = job_id;
  }
  return "<a href='/jobs/" + job_id +"'>" + val + "</a>";
}
function WorkOrderAcknowledge(value, row, index) {
  if (row.acknowledgement == true) {
    return "Work Order Acknolwedged"
  } else {
    return "<a href='/jobs/" + row.job_id +"/work_orders/" + row.id + "/acknolwedge'>Acknolwedge Work Order</a>";
  }
}
function AddVendor(value, row, index) {
  return "<a class='add-call' target='_blank' href='call_id=" + row.id + "'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></a>";
}
function AddContact(value, row, index) {
  return "<a class='add-contact' href='id=" + row.id + "&name=" + row.first_name + "'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></a>";
}
function CallRailTimeline(value, row, index) {
  return "<a href='https://app.callrail.com/calls/" + value + "'>Timeline Link</a>";
}
function ReturnCallRail(value, row, index){
  return "<a class='btn btn-primary' href='https://app.callrail.com/a/686639065/leadcenter/#/calls/" + value + "'>Return Call</a>";
}
