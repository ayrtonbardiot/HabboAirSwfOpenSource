// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.toolbar.ExtensionView

package com.sulake.habbo.toolbar
{
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core._SafeStr_79;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.Timer;
    import com.sulake.habbo.toolbar.events.ExtensionViewEvent;
    import flash.events.TimerEvent;
    import flash.geom.Rectangle;

    public class ExtensionView implements IExtensionView 
    {

        private static const MARGIN:int = 3;
        private static const PURSE_EXTENSION_OFFSET:int = -8;

        private var _toolbar:HabboToolbar;
        private var _SafeStr_5268:IItemListWindow;
        private var _items:_SafeStr_24;
        private var _disposed:Boolean = false;
        private var _landingView:Boolean = false;
        private var _SafeStr_5269:Array = [];
        private var _windowManager:_SafeStr_1695;
        private var _extraMargin:int = 0;

        public function ExtensionView(_arg_1:_SafeStr_1695, _arg_2:_SafeStr_21, _arg_3:HabboToolbar)
        {
            _toolbar = _arg_3;
            _windowManager = _arg_1;
            var _local_5:XmlAsset = (_arg_2.getAssetByName("extension_grid_xml") as XmlAsset);
            if (_local_5)
            {
                _SafeStr_5268 = (_arg_1.buildFromXML((_local_5.content as XML), 1) as IItemListWindow);
            };
            var _local_4:_SafeStr_3133 = _SafeStr_5268.desktop;
            if (_SafeStr_5268)
            {
                _SafeStr_5268.x = (((_local_4.width - _SafeStr_5268.width) - 3) - extraMargin);
                _SafeStr_5268.y = 3;
                _SafeStr_5268.visible = true;
            }
            else
            {
                _SafeStr_79.error("Unable to initialize Toolbar Extension view window from xml asset", false);
            };
            _items = new _SafeStr_24();
        }

        public function dispose():void
        {
            var _local_1:* = null;
            var _local_2:* = null;
            if (!_disposed)
            {
                _local_1 = _items.getKeys();
                for each (_local_2 in _local_1)
                {
                    detachExtension(_local_2);
                };
                if (_SafeStr_5268)
                {
                    _SafeStr_5268.dispose();
                    _SafeStr_5268 = null;
                };
                _SafeStr_5269 = null;
                _toolbar = null;
                _items = null;
                _disposed = true;
            };
        }

        public function get visible():Boolean
        {
            return ((_SafeStr_5268) && (_SafeStr_5268.visible));
        }

        public function get screenHeight():uint
        {
            if (!_SafeStr_5268)
            {
                return (0);
            };
            return (_SafeStr_5268.height + _SafeStr_5268.y);
        }

        public function attachExtension(_arg_1:String, _arg_2:_SafeStr_3109, _arg_3:int=-1, _arg_4:Array=null):void
        {
            if (!_disposed)
            {
                if (_items.getValue(_arg_1))
                {
                    return;
                };
                _items.add(_arg_1, _arg_2);
                _arg_3 = ((_arg_4 != null) ? resolveIndex(_arg_4) : _arg_3);
                if (_arg_3 == -1)
                {
                    _SafeStr_5269.push(_arg_2);
                }
                else
                {
                    _SafeStr_5269.splice(_arg_3, 0, _arg_2);
                };
                if (_SafeStr_5268)
                {
                    _toolbar.createAndAttachDimmerWindow((_arg_2 as _SafeStr_3133));
                    refreshItemWindow();
                };
                queueResizeEvent();
            };
        }

        public function hasExtension(_arg_1:String):Boolean
        {
            return (!(_items.getValue(_arg_1) == null));
        }

        private function getKeyForWindow(_arg_1:_SafeStr_3109):String
        {
            var _local_2:int = _items.getValues().indexOf(_arg_1);
            if (_local_2 != -1)
            {
                return (_items.getKeys()[_local_2]);
            };
            return ("");
        }

        public function refreshItemWindow():void
        {
            var _local_2:* = null;
            _SafeStr_5268.removeListItems();
            for each (var _local_1:_SafeStr_3109 in _SafeStr_5269)
            {
                _local_2 = getKeyForWindow(_local_1);
                switch (_local_2)
                {
                    case "logout_tools":
                    case "purse_credits":
                    case "purse_engagement_currency":
                    case "purse_habbo_club":
                    case "purse_seasonal_currency":
                    case "talent_promo":
                    case "club_promo":
                    case "vip_quests":
                    case "video_offers":
                    case "settings":
                    case "phone_number":
                    case "verification_code":
                    case "return_gift":
                    case "targeted_offer":
                        _SafeStr_5268.addListItem(_local_1);
                        break;
                    case "purse":
                        _SafeStr_5268.addListItem(_local_1);
                        _SafeStr_5268.y = (3 + -8);
                        break;
                    default:
                        if (!_landingView)
                        {
                            _SafeStr_5268.addListItem(_local_1);
                        };
                };
            };
            _SafeStr_5268.arrangeListItems();
            _SafeStr_5268.invalidate();
        }

        private function resolveIndex(_arg_1:Array):int
        {
            var _local_2:int;
            _local_2 = 0;
            while (_local_2 < _SafeStr_5269.length)
            {
                if (_arg_1.indexOf(_SafeStr_5269[_local_2].name) > -1)
                {
                    return (_local_2);
                };
                _local_2++;
            };
            return (-1);
        }

        public function detachExtension(_arg_1:String):void
        {
            var _local_2:* = null;
            if (!_disposed)
            {
                _local_2 = _items[_arg_1];
                if (_local_2 != null)
                {
                    _SafeStr_5269.splice(_SafeStr_5269.indexOf(_local_2), 1);
                    if (_SafeStr_5268)
                    {
                        _toolbar.removeDimmer(_local_2);
                        refreshItemWindow();
                    };
                };
                _items.remove(_arg_1);
                queueResizeEvent();
            };
        }

        private function queueResizeEvent():void
        {
            var _local_1:Timer = new Timer(25, 1);
            _local_1.addEventListener("timerComplete", onResizeTimer);
            _local_1.start();
        }

        private function onResizeTimer(_arg_1:TimerEvent):void
        {
            if (_toolbar)
            {
                _toolbar.events.dispatchEvent(new ExtensionViewEvent("EVE_EXTENSION_VIEW_RESIZED"));
            };
        }

        public function set visible(_arg_1:Boolean):void
        {
            if (_SafeStr_5268)
            {
                _SafeStr_5268.visible = _arg_1;
            };
        }

        public function removeDimmers():void
        {
            for each (var _local_1:_SafeStr_3133 in _SafeStr_5269)
            {
                _toolbar.removeDimmer(_local_1);
            };
        }

        public function getIconLocation(_arg_1:String):Rectangle
        {
            var _local_3:* = null;
            var _local_2:* = null;
            switch (_arg_1)
            {
                case "HTIE_EXT_GROUP":
                    _local_3 = (_items["room_group_info"] as _SafeStr_3109);
            };
            if (((!(_local_3 == null)) && (_local_3.visible)))
            {
                _local_2 = new Rectangle();
                _local_3.getGlobalRectangle(_local_2);
                return (_local_2);
            };
            return (null);
        }

        public function getIcon(_arg_1:String):_SafeStr_3109
        {
            var _local_2:* = null;
            if (_arg_1 == "HTIE_EXT_GROUP")
            {
                _local_2 = (_items["room_group_info"] as _SafeStr_3109);
            };
            return (_local_2);
        }

        public function get landingView():Boolean
        {
            return (_landingView);
        }

        public function set landingView(_arg_1:Boolean):void
        {
            _landingView = _arg_1;
            refreshItemWindow();
        }

        public function set extraMargin(_arg_1:int):void
        {
            _extraMargin = _arg_1;
            if (_SafeStr_5268)
            {
                _SafeStr_5268.x = (((_SafeStr_5268.desktop.width - _SafeStr_5268.width) - 3) - extraMargin);
            };
        }

        public function get extraMargin():int
        {
            return (_extraMargin);
        }


    }
}//package com.sulake.habbo.toolbar

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_5268 = "_-9R" (String#2571, DoABC#4)
// _SafeStr_5269 = "_-Yq" (String#5710, DoABC#4)
// _SafeStr_79 = "_-411" (String#2835, DoABC#4)


