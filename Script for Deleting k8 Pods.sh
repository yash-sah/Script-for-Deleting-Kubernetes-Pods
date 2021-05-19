kubectl get pods > pod_details.txt
cat pod_details.txt|while read line;

do
details=($line)
pod_name="${details[0]}"
age="${details[4]}"
status="${details[2]}"


if [[ $pod_name == *"driver"* ]] && [[ $status == *"Running"* ]] && [[ $age == *"d"* ]]
then
  echo $pod_name $age
  kubectl delete $pod_name
fi
threshold=4
var="${age:0:1}"
if [[ $pod_name == *"driver"* ]] && [[ $status == *"Running"* ]] && [[ $age == *"h"* ]] && [[ $var -gt $threshold ]]
then
  echo $pod_name $age $status
  kubectl delete $pod_name
fi
done;
