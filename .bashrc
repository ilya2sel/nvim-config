# Custom cd behavior
cd() {
    case "$1" in
        "")
            builtin cd ~
            ;;
        local)
            builtin cd /workspaces/obi-dev-env/
            ;;
        sc)
            builtin cd /workspaces/obi-dev-env/apps/frontend/shipping-center/
            ;;
        rdm)
            builtin cd /workspaces/obi-dev-env/apps/frontend/rdm/
            ;;
        tracking-app)
            builtin cd /workspaces/obi-dev-env/apps/frontend/tracking-app/
            ;;
        reviews-app)
            builtin cd /workspaces/obi-dev-env/apps/frontend/customer-reviews-form/
            ;;
        warehouses-app)
            builtin cd /workspaces/obi-dev-env/apps/mobile/Xpedigo-Warehouses/
            ;;
        drivers-app)
            builtin cd /workspaces/obi-dev-env/apps/mobile/xpedigo-drivers/
            ;;
        accounts)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-accounts/
            ;;
        dispatch)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-dispatch-routing/
            ;;
        pod)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-pod/
            ;;
        tracking)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-shipment-tracking/
            ;;
        warehouse)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-warehouse/
            ;;
        xre)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-xre/
            ;;
        communications)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-communications/
            ;;
        orders)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-orders/
            ;;
        area-resolver)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-shipment-area-resolver/
            ;;
        shipments)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-shipments/
            ;;
        territory)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-territory-management/
            ;;
        vehicles)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-vehicles/
            ;;
        websockets)
            builtin cd /workspaces/obi-dev-env/apps/services/php/service-websockets/
            ;;
        auth)
            builtin cd /workspaces/obi-dev-env/apps/lambda/api-gateway-auth/
            ;;
        layers)
            builtin cd /workspaces/obi-dev-env/apps/lambda/layers/
            ;;
        exports)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-exports/
            ;;
        migrations)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-lambda-migrations/
            ;;
        redis-trimmer)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-redis-trimmer/
            ;;
        reviews)
            builtin cd /workspaces/obi-dev-env/apps/lambda/service-reviews/
            ;;
        *)
            builtin cd "$1"     # Default to normal behavior for other paths
            ;;
    esac
}
