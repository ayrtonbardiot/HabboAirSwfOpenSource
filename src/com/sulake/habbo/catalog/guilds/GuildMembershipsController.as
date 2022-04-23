// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.guilds.GuildMembershipsController

package com.sulake.habbo.catalog.guilds
{
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.habbo.catalog.viewer.widgets.GuildSelectorCatalogWidget;
    import _-XO._SafeStr_732;
    import _-W1K._SafeStr_562;

    public class GuildMembershipsController 
    {

        private var _catalog:HabboCatalog;
        private var _SafeStr_5379:GuildSelectorCatalogWidget;

        public function GuildMembershipsController(_arg_1:HabboCatalog)
        {
            _catalog = _arg_1;
        }

        public function dispose():void
        {
            _catalog = null;
            _SafeStr_5379 = null;
        }

        public function get catalog():HabboCatalog
        {
            return (_catalog);
        }

        public function registerGuildSelectorWidget(_arg_1:GuildSelectorCatalogWidget):void
        {
            _SafeStr_5379 = _arg_1;
            _catalog.connection.send(new _SafeStr_732());
        }

        public function unregisterGuildSelectorWidget(_arg_1:GuildSelectorCatalogWidget):void
        {
            if (_SafeStr_5379 == _arg_1)
            {
                _SafeStr_5379 = null;
            }
            else
            {
                _SafeStr_14.log("ERROR: Tried to unregister a nonregistered group selector catalog widget");
            };
        }

        public function onGuildMembershipsMessageEvent(_arg_1:_SafeStr_562):void
        {
            var _local_2:Array = _arg_1.guilds.slice(0, _arg_1.guilds.length);
            if (((_SafeStr_5379) && (!(_SafeStr_5379.disposed))))
            {
                _SafeStr_5379.populateAndSelectFavorite(_local_2);
                _SafeStr_5379.selectFirstOffer();
            };
        }

        public function onGuildVisualSettingsChanged(_arg_1:int):void
        {
            if (_SafeStr_5379 != null)
            {
                _catalog.connection.send(new _SafeStr_732());
            };
        }


    }
}//package com.sulake.habbo.catalog.guilds

// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_5379 = "_-25" (String#5629, DoABC#4)
// _SafeStr_562 = "_-fO" (String#19095, DoABC#4)
// _SafeStr_732 = "_-F1h" (String#18684, DoABC#4)


