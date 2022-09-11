export default [
    { 
        path: '/', 
        component: () => import('../App.vue'),
        children: [
            {
                path: '',
                component: () => import('../page/index/Index.vue')
            }
        ],
    },
    {
        path: '/introduce',
        component: () => import('../App.vue'),
        children: [
            {
                path: '',
                component: () => import('../page/aboutus/Aboutus.vue')
            }
        ]
    },
    {
        path: '/best',
        component: () => import('../App.vue'),
        children: [
            {
                path: '',
                component: () => import('../page/best/best.vue')
            }
        ]
    },
    {
        path: '/shop',
        component: () => import('../App.vue'),
        children: [
            {
                path: 'skincare',
                component: () => import('../page/shop/Shop.vue'),
                props: {
                    pageName: 'Skin Care',
                    prodKbn: 1,
                },
            },
            {
                path: 'makeup',
                component: () => import('../page/shop/Shop.vue'),
                props: {
                    pageName: 'Make up',
                    prodKbn: 2,
                },
            },
            {
                path: 'bodyhair',
                component: () => import('../page/shop/Shop.vue'),
                props: {
                    pageName: 'Body & Hair',
                    prodKbn: 3,
                },
            },
            {
                path: 'accessories',
                component: () => import('../page/shop/Shop.vue'),
                props: {
                    pageName: 'Accessories',
                    prodKbn: 4,
                },
            },
            {
                path: 'nails',
                component: () => import('../page/shop/Shop.vue'),
                props: {
                    pageName: 'Nails',
                    prodKbn: 5,
                },
            }
        ],
    },
    {
        path: '/community',
        component: () => import('../App.vue'),
        children: [
            {
                path: 'event',
                component: () => import('../page/community/Community.vue'),
                props: {
                    pageName: 'Event',
                },
            },
            {
                path: 'notice',
                component: () => import('../page/community/Community.vue'),
                props: {
                    pageName: 'Notice',
                },
            },
            {
                path: 'usercommunication',
                component: () => import('../page/community/Community.vue'),
                props: {
                    pageName: 'usercommunication',
                },
            }
        ],
    },
    {
        path: '/review',
        component: () => import('../App.vue'),
        children: [
            {
                path: '',
                component: () => import('../page/review/Review.vue')
            }
        ],
    },
    {
        path: '/product',
        component: () => import('../App.vue'),
        children: [
            {
                path: ':prodId/detail',
                component: () => import('../page/product/product.vue'),
                props: true,
            }
        ],
    },
]