module Optimacms
  module AdminMenu
    class AdminMenu
      include Optimacms::Concerns::AdminMenu::AdminMenu

      def self.get_menu_custom
        # add your menu items here
        [
            {
                title: 'Run checks', route: nil,
                submenu: [
                    {title: 'Run checks', url: '/admin/runner/select' },
                ]
            },
            {
                title: 'Servers', route: nil,
                submenu: [
                    {title: 'Servers', url: '/admin/servers' },
                ]
            },
            {
                title: 'Checks', route: nil,
                submenu: [
                    {title: 'Check sets', url: '/admin/checksets' },
                    {title: 'Checks', url: '/admin/checks' },
                ]
            },
        ]

      end

    end
  end
end
