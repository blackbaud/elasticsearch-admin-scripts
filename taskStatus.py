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
    
    totalCount = status['total']
    updatedCount = status['updated']
    createdCount = status['created']
    deletedCount = status['deleted']
    conflictCount = status['version_conflicts']
    processedCount = updatedCount + createdCount + conflictCount + deletedCount
    creationRatio = round(createdCount / processedCount * 100, 2) if processedCount > 0 else 0
    percentComplete = round(processedCount / totalCount * 100, 2) if totalCount > 0 else 0
    progressBar = '[' + '#' * int(percentComplete / 100 * progressBarLength) + ' ' * int((100 - percentComplete) / 100 * progressBarLength) + ']'
    remainingCount = totalCount - processedCount
    
    ratePerSecond = round(processedCount / timeInSeconds) if timeInSeconds > 0 else 0
    remainingTimeInSeconds = round(remainingCount / ratePerSecond) if ratePerSecond > 0 else 0
    
    report = taskId + ' - ' + emailLetter + '\n'
    report = report + progressBar + '\n'
    report = report + '  elapsed time : ' + str(datetime.timedelta(seconds=timeInSeconds)) + '\n'
    report = report + '  processed    : ' + str(percentComplete) + '%\n'
    report = report + '  createRatio  : ' + str(creationRatio) + '%\n'
    report = report + '  rate         : ' + str(ratePerSecond) + ' per second\n'
    report = report + '  remaining    : ' + str(remainingCount) + '\n'
    report = report + '               : ' + str(datetime.timedelta(seconds=remainingTimeInSeconds))
    reports[emailLetter] = report

print('\n\n==== Current Task Report ====\n')
for reportKey in sorted(reports):
  print(reports[reportKey])
  print('')
