$zip_folder = mkdir ("build" + " " +($(get-date -f MM-dd-yyyy-HH-mm-ss)))
Move-Item -Path "dist/app.exe" -Destination $zip_folder
Compress-Archive -Path $zip_folder -DestinationPath $zip_folder
jfrog config remove
jfrog config s 
jfrog config add artifactory-demo --url=http://localhost:8082/ --user=admin --password=ravi@Jfrog70
jfrog config s
jfrog rt u "build*.zip" localjfrogrepo --url=http://localhost:8082/artifactory
