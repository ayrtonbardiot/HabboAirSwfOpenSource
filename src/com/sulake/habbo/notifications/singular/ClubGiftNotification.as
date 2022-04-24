// by nota

//com.sulake.habbo.notifications.singular.ClubGiftNotification

package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IIconWindow;

    public class ClubGiftNotification 
    {

        private static const TOOLBAR_EXTENSION_ID:String = "club_gift_notification";
        private static const LINK_COLOR_NORMAL:uint = 0xFFFFFF;
        private static const LINK_COLOR_HIGHLIGHT:uint = 12247545;
        private static const ICON_STYLE_CLUB:int = 13;
        private static const ICON_STYLE_VIP:int = 14;

        private var _window:_SafeStr_3195;
        private var _catalog:IHabboCatalog;
        private var _toolbar:IHabboToolbar;
        private var _SafeStr_6437:ITextWindow;

        public function ClubGiftNotification(_arg_1:int, _arg_2:_SafeStr_21, _arg_3:_SafeStr_1695, _arg_4:IHabboCatalog, _arg_5:IHabboToolbar)
        {
            if ((((!(_arg_2)) || (!(_arg_3))) || (!(_arg_4))))
            {
                return;
            };
            _catalog = _arg_4;
            _toolbar = _arg_5;
            var _local_6:XmlAsset = (_arg_2.getAssetByName("club_gift_notification_xml") as XmlAsset);
            if (_local_6 == null)
            {
                return;
            };
            _window = (_arg_3.buildFromXML((_local_6.content as XML)) as _SafeStr_3195);
            if (_window == null)
            {
                return;
            };
            _window.procedure = eventHandler;
            _toolbar.extensionView.attachExtension("club_gift_notification", _window);
            _SafeStr_6437 = (_window.findChildByName("cancel_link") as ITextWindow);
            var _local_7:IRegionWindow = (_window.findChildByName("cancel_link_region") as IRegionWindow);
            if (_local_7)
            {
                _local_7.addEventListener("WME_OVER", onMouseOver);
                _local_7.addEventListener("WME_OUT", onMouseOut);
            };
            setClubIcon(13);
        }

        public function get visible():Boolean
        {
            return ((_window) && (_window.visible));
        }

        public function dispose():void
        {
            if (_toolbar)
            {
                _toolbar.extensionView.detachExtension("club_gift_notification");
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _catalog = null;
        }

        private function setImage(_arg_1:String, _arg_2:BitmapData):void
        {
            if (_window == null)
            {
                return;
            };
            var _local_3:_SafeStr_3264 = (_window.findChildByName(_arg_1) as _SafeStr_3264);
            if (_local_3 == null)
            {
                return;
            };
            var _local_4:BitmapData = new BitmapData(_local_3.width, _local_3.height, true, 0);
            var _local_5:int = ((_local_4.width * 0.5) - _arg_2.width);
            var _local_6:int = ((_local_4.height * 0.5) - _arg_2.height);
            _local_4.draw(_arg_2, new Matrix(2, 0, 0, 2, _local_5, _local_6));
            _local_3.bitmap = _local_4;
        }

        private function eventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "open_catalog_button":
                    if (_catalog)
                    {
                        _catalog.openCatalogPage("club_gifts");
                    };
                    dispose();
                    return;
                case "cancel_link_region":
                case "cancel_link":
                    dispose();
                    return;
            };
        }

        private function onMouseOver(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_6437.textColor = 12247545;
        }

        private function onMouseOut(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_6437.textColor = 0xFFFFFF;
        }

        private function setClubIcon(_arg_1:int):void
        {
            var _local_2:* = null;
            if (_window)
            {
                _local_2 = (_window.findChildByName("club_icon") as IIconWindow);
                if (_local_2)
                {
                    _local_2.style = _arg_1;
                    _local_2.invalidate();
                };
            };
        }


    }
}//package com.sulake.habbo.notifications.singular

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_6437 = "_-t1a" (String#7174, DoABC#4)


