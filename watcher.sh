#!/bin/bash

# Define Variables
namespace="sre"
deployment_name="swype-app"
maximum_restarts_allowed="3"

# Start Infinite Loop
while true; do
    # Check Pod Restarts
    restarts=$(kubectl get pods -n "$namespace" -l app="$deployment_name" -o=jsonpath='{.items[0].status.containerStatuses[0].restartCount}')

    # Display Restart Count
    echo "Current restarts: $restarts"

    # Check Restart Limit
    if [ "$restarts" -gt "$maximum_restarts_allowed" ]; then
        echo "Exceeded maximum restarts. Scaling down deployment."

        # Scale Down Deployment
        kubectl scale deployment "$deployment_name" --replicas=0 -n "$namespace"

        # Break the Loop
        break
    else
        # Pause for 60 seconds
        echo "Waiting for 60 seconds before checking again..."
        sleep 60
    fi
done
