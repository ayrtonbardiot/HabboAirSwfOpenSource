// by nota

//com.sulake.habbo.catalog.viewer.widgets.GuildBadgeViewCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3349;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetGuildSelectedEvent;

    public class GuildBadgeViewCatalogWidget extends CatalogWidget implements _SafeStr_3303 
    {

        private var _SafeStr_6281:GuildMembershipsController;

        public function GuildBadgeViewCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:GuildMembershipsController)
        {
            super(_arg_1);
            _SafeStr_6281 = _arg_2;
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                _SafeStr_6281 = null;
                super.dispose();
            };
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return (false);
            };
            attachWidgetView("guildBadgeViewWidget");
            events.addEventListener("GUILD_SELECTED", onGuildSelected);
            return (true);
        }

        private function onGuildSelected(_arg_1:CatalogWidgetGuildSelectedEvent):void
        {
            if (disposed)
            {
                return;
            };
            var _local_2:_SafeStr_3349 = (_SafeStr_3199(_window.findChildByName("badge")).widget as _SafeStr_3349);
            if (_local_2 != null)
            {
                _local_2.badgeId = _arg_1.badgeCode;
                _local_2.groupId = _arg_1.guildId;
            };
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3303 = "_-g1Z" (String#1682, DoABC#4)
// _SafeStr_3349 = "_-c1x" (String#1353, DoABC#4)
// _SafeStr_6281 = "_-415" (String#5026, DoABC#4)


