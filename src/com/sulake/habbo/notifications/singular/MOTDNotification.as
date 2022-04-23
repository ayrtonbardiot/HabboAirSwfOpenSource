// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.notifications.singular.MOTDNotification

package com.sulake.habbo.notifications.singular
{
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class MOTDNotification 
    {

        private const LIST_ITEM_HEIGHT_MARGIN:int = 20;

        private var _window:_SafeStr_3263;
        private var _SafeStr_4020:_SafeStr_18;
        private var _SafeStr_5642:Array;

        public function MOTDNotification(_arg_1:Array, _arg_2:_SafeStr_21, _arg_3:_SafeStr_1695)
        {
            var _local_9:* = null;
            var _local_8:* = null;
            var _local_7:* = null;
            super();
            if (((!(_arg_3)) || (!(_arg_2))))
            {
                return;
            };
            _SafeStr_5642 = _arg_1;
            var _local_6:XmlAsset = (_arg_2.getAssetByName("motd_notification_xml") as XmlAsset);
            if (_local_6 == null)
            {
                return;
            };
            _window = (_arg_3.buildFromXML((_local_6.content as XML)) as _SafeStr_3263);
            if (_window == null)
            {
                return;
            };
            _window.procedure = eventHandler;
            _window.center();
            var _local_5:XmlAsset = (_arg_2.getAssetByName("motd_notification_item_xml") as XmlAsset);
            if (_local_5 == null)
            {
                return;
            };
            var _local_4:_SafeStr_3133 = (_arg_3.buildFromXML((_local_5.content as XML)) as _SafeStr_3133);
            var _local_10:IItemListWindow = (_window.findChildByName("message_list") as IItemListWindow);
            for each (_local_9 in _SafeStr_5642)
            {
                _local_8 = (_local_4.clone() as _SafeStr_3133);
                _local_7 = (_local_8.findChildByName("message_text") as ITextWindow);
                _local_7.text = _local_9;
                _local_8.height = (_local_7.textHeight + 20);
                _local_10.addListItem(_local_8);
            };
        }

        public function dispose():void
        {
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            _SafeStr_4020 = null;
        }

        private function eventHandler(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type != "WME_CLICK")
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "close":
                case "header_button_close":
                    dispose();
                    return;
            };
        }


    }
}//package com.sulake.habbo.notifications.singular

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_4020 = "_-el" (String#1659, DoABC#4)
// _SafeStr_5642 = "_-oE" (String#8607, DoABC#4)


