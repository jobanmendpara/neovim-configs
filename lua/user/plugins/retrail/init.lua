local status_ok, retrail = pcall(require, 'retrail')
if not status_ok then
  return
end

retrail.setup()
