# Custom cd behavior
cd() {
    case "$1" in
        "")
            builtin cd ~
            ;;
        local)
            builtin cd /workspaces/local-services-tester/
            ;;
        sc)
            builtin cd /workspaces/local-services-tester/apps/frontend/shipping-center/
            ;;
        rdm)
            builtin cd /workspaces/local-services-tester/apps/frontend/rdm/
            ;;
        tracking-app)
            builtin cd /workspaces/local-services-tester/apps/frontend/tracking-app/
            ;;
        reviews-app)
            builtin cd /workspaces/local-services-tester/apps/frontend/customer-reviews-form/
            ;;
        warehouses-app)
            builtin cd /workspaces/local-services-tester/apps/mobile/Xpedigo-Warehouses/
            ;;
        drivers-app)
            builtin cd /workspaces/local-services-tester/apps/mobile/xpedigo-drivers/
            ;;
        accounts)
            builtin cd /workspaces/local-services-tester/apps/services/service-accounts/
            ;;
        dispatch)
            builtin cd /workspaces/local-services-tester/apps/services/service-dispatch-routing/
            ;;
        pod)
            builtin cd /workspaces/local-services-tester/apps/services/service-pod/
            ;;
        tracking)
            builtin cd /workspaces/local-services-tester/apps/services/service-shipment-tracking/
            ;;
        warehouse)
            builtin cd /workspaces/local-services-tester/apps/services/service-warehouse/
            ;;
        xre)
            builtin cd /workspaces/local-services-tester/apps/services/service-xre/
            ;;
        communications)
            builtin cd /workspaces/local-services-tester/apps/services/service-communications/
            ;;
        orders)
            builtin cd /workspaces/local-services-tester/apps/services/service-orders/
            ;;
        area-resolver)
            builtin cd /workspaces/local-services-tester/apps/services/service-shipment-area-resolver/
            ;;
        shipments)
            builtin cd /workspaces/local-services-tester/apps/services/service-shipments/
            ;;
        territory)
            builtin cd /workspaces/local-services-tester/apps/services/service-territory-management/
            ;;
        vehicles)
            builtin cd /workspaces/local-services-tester/apps/services/service-vehicles/
            ;;
        websockets)
            builtin cd /workspaces/local-services-tester/apps/services/service-websockets/
            ;;
        *)
            builtin cd "$1"     # Default to normal behavior for other paths
            ;;
    esac
}
