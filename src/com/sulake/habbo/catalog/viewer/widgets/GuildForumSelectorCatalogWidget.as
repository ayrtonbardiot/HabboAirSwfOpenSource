// by nota

//com.sulake.habbo.catalog.viewer.widgets.GuildForumSelectorCatalogWidget

package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.guilds.GuildMembershipsController;
    import _-W1K._SafeStr_1637;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetShowWarningTextEvent;

    public class GuildForumSelectorCatalogWidget extends GuildSelectorCatalogWidget 
    {

        public function GuildForumSelectorCatalogWidget(_arg_1:_SafeStr_3133, _arg_2:GuildMembershipsController)
        {
            super(_arg_1, _arg_2);
        }

        override protected function filterGroupMemberships(_arg_1:Array):Array
        {
            var _local_2:Array = [];
            var _local_4:int = _SafeStr_6281.catalog.sessionDataManager.userId;
            var _local_3:Boolean = _SafeStr_6281.catalog.sessionDataManager.hasSecurity(4);
            for each (var _local_5:_SafeStr_1637 in _arg_1)
            {
                if (!(((!(_local_5.hasForum)) && (!(_local_5.ownerId == _local_4))) && (!(_local_3))))
                {
                    _local_2.push(_local_5);
                };
            };
            return (_local_2);
        }

        override protected function selectGroup(_arg_1:_SafeStr_1637):void
        {
            super.selectGroup(_arg_1);
            events.dispatchEvent(new CatalogWidgetShowWarningTextEvent(((_arg_1.hasForum) ? "${catalog.alert.group_has_forum}" : "")));
        }


    }
}//package com.sulake.habbo.catalog.viewer.widgets

// _SafeStr_1637 = "_-M5" (String#6982, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_6281 = "_-415" (String#5026, DoABC#4)


