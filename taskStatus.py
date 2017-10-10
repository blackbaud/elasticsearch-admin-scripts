import sys, json, datetime
letterMarker = '.value % 5 == '
progressBarLength = 33
baseJson = json.load(sys.stdin)
reports = {}
for nodeName in baseJson['nodes']:
  node = baseJson['nodes'][nodeName]
  for taskId in node['tasks']:
    task = node['tasks'][taskId]
    runningTimeNanos = task['running_time_in_nanos']
    description = task['description']
    
    emailLetterMarkerLocation = description.find(letterMarker)
    emailLetter = description[emailLetterMarkerLocation + len(letterMarker)] if description.find(letterMarker) > -1 else '?'
    
    timeInSeconds = round(runningTimeNanos / 1000000000)
    status = task['status']
    
    if 'slice_id' in status:
      sliceId = status['slice_id']
    else:
      sliceId = task['id']
    totalCount = status['total']
    updatedCount = status['updated']
    createdCount = status['created']
    deletedCount = status['deleted']
    noopsCount = status['noops']
    conflictCount = status['version_conflicts']
    
    processedCount = updatedCount + createdCount + conflictCount + deletedCount
    creationRatio = round(createdCount / processedCount * 100, 2) if processedCount > 0 else 0
    percentComplete = round(processedCount / totalCount * 100, 2) if totalCount > 0 else 0
    progressBar = '[' + '#' * int(percentComplete / 100 * progressBarLength) + ' ' * int((100 - percentComplete) / 100 * progressBarLength) + ']'
    remainingCount = totalCount - processedCount
    
    ratePerSecond = round(processedCount / timeInSeconds) if timeInSeconds > 0 else 0
    remainingTimeInSeconds = round(remainingCount / ratePerSecond) if ratePerSecond > 0 else 0
    
    report = taskId + ' - ' + str(sliceId).rjust(6) + ' '
    report = report + progressBar + ' - '
    report = report + str(remainingCount).rjust(5) + ' remaining @ '
    report = report + str(ratePerSecond).rjust(5) + ' per second => '
    report = report + str(datetime.timedelta(seconds=remainingTimeInSeconds)) + '   ('
    report = report + str(noopsCount).rjust(5) + ' no ops)'
    reports[sliceId] = report
print('\n\n==== Current Task Report ====\n')
for reportKey in sorted(reports):
  print(reports[reportKey])

