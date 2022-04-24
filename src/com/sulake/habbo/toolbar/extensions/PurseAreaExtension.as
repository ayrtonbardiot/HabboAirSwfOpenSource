// by nota

//com.sulake.habbo.toolbar.extensions.PurseAreaExtension

package com.sulake.habbo.toolbar.extensions
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.toolbar.HabboToolbar;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.toolbar.extensions.purse.PurseClubArea;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.catalog.purse.PurseEvent;
    import flash.geom.Rectangle;
    import com.sulake.core.window.events._SafeStr_3116;

    public class PurseAreaExtension implements _SafeStr_13 
    {

        private static const MENU_HELP:String = "HELP";

        private var _toolbar:HabboToolbar;
        private var _window:_SafeStr_3133;
        private var _clubArea:PurseClubArea;
        private var _catalog:IHabboCatalog;

        public function PurseAreaExtension(_arg_1:HabboToolbar, _arg_2:IHabboCatalog)
        {
            _toolbar = _arg_1;
            _window = (_toolbar.windowManager.buildFromXML((_arg_1.assets.getAssetByName("purse_xml").content as XML)) as _SafeStr_3133);
            _window.procedure = windowProcedure;
            _clubArea = new PurseClubArea(_arg_1, (_window as _SafeStr_3133));
            _catalog = _arg_2;
            _catalog.events.addEventListener("catalog_purse_credit_balance", onCreditsBalance);
            _catalog.events.addEventListener("catalog_purse_activity_point_balance", onPointBalance);
            updateCreditAndPointValues();
            _arg_1.extensionView.attachExtension("purse", _window, 0);
            var _local_3:_SafeStr_3109 = _window.findChildByName("credit_count");
            _toolbar.windowManager.registerHintWindow("credit_count", _local_3);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _clubArea.dispose();
            _catalog = null;
            _toolbar = null;
        }

        public function get disposed():Boolean
        {
            return (_toolbar == null);
        }

        public function getClubArea():PurseClubArea
        {
            return (_clubArea);
        }

        private function updateCreditAndPointValues():void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            var _local_1:_SafeStr_3109 = _window.findChildByName("credit_count");
            if (_local_1 != null)
            {
                _local_1.caption = _catalog.getPurse().credits.toString();
            };
            var _local_4:_SafeStr_3109 = _window.findChildByName("ducket_count");
            if (_local_4 != null)
            {
                _local_4.caption = _catalog.getPurse().getActivityPointsForType(0).toString();
            };
            if (_toolbar.getBoolean("diamonds.enabled"))
            {
                _local_2 = _window.findChildByName("diamond_count");
                if (_local_2)
                {
                    _local_2.caption = _catalog.getPurse().getActivityPointsForType(5).toString();
                };
            }
            else
            {
                _local_3 = _window.findChildByName("diamond_count_button");
                _local_5 = (_window.findChildByName("purse_itemlist") as IItemListWindow);
                if (((_local_3) && (_local_5)))
                {
                    _local_5.removeListItem(_local_3);
                };
            };
        }

        public function onCreditsBalance(_arg_1:PurseEvent):void
        {
            var _local_3:String = _arg_1.balance.toString();
            var _local_2:_SafeStr_3109 = _window.findChildByName("credit_count");
            if (_local_2 != null)
            {
                _local_2.caption = _local_3.toString();
            };
        }

        public function onPointBalance(_arg_1:PurseEvent):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            switch (_arg_1.activityPointType)
            {
                case 0:
                    _local_2 = _window.findChildByName("ducket_count");
                    break;
                case 5:
                    _local_2 = _window.findChildByName("diamond_count");
                default:
            };
            if (_local_2 != null)
            {
                _local_3 = _arg_1.balance.toString();
                _local_2.caption = _local_3.toString();
            };
        }

        public function getIconLocation(_arg_1:String):Rectangle
        {
            var _local_2:* = null;
            var _local_3:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_3)
            {
                _local_2 = _local_3.rectangle;
                _local_2.x = (_local_2.x + (_window.desktop.width - _window.width));
                _local_2.y = (_local_2.y + _window.y);
            };
            return (_local_2);
        }

        public function getIcon(_arg_1:String):_SafeStr_3109
        {
            return (_window.findChildByName(_arg_1));
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            _toolbar.windowManager.hideMatchingHint(_arg_2.name);
            switch (_arg_2.name)
            {
                case "vault_button":
                    _toolbar.catalog.openVault();
                    return;
                case "hc_join_button":
                    _toolbar.catalog.openClubCenter();
                    return;
                case "help_button":
                    _toolbar.toggleWindowVisibility("HELP");
                    return;
                case "settings_button":
                    _toolbar.toggleSettingVisibility();
                    return;
                case "credit_count_button":
                    _catalog.openCreditsHabblet();
                    return;
                case "ducket_count_button":
                    _catalog.openCatalogPage("ducket_info");
                    return;
                case "diamond_count_button":
                    _catalog.openCatalogPage("loyalty_info");
                    return;
                case "logout_button":
                    _toolbar.reboot();
                    return;
            };
        }


    }
}//package com.sulake.habbo.toolbar.extensions

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


