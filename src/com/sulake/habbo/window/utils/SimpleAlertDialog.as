// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.utils.SimpleAlertDialog

package com.sulake.habbo.window.utils
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components.ITextLinkWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class SimpleAlertDialog implements _SafeStr_13 
    {

        private static const WINDOW_MARGIN:int = 10;

        private var _disposed:Boolean;
        private var _SafeStr_4003:IModalDialog;
        private var _SafeStr_5275:String;
        private var _window:_SafeStr_3133;
        private var _SafeStr_4162:IItemListWindow;
        private var _SafeStr_5277:IItemListWindow;
        private var _SafeStr_5278:IItemListWindow;
        private var _SafeStr_5270:_SafeStr_3109;
        private var _SafeStr_5271:_SafeStr_3109;
        private var _SafeStr_5272:ITextLinkWindow;
        private var _SafeStr_5273:IStaticBitmapWrapperWindow;
        private var _SafeStr_5276:Function;
        private var _SafeStr_5274:Function;
        private var _windowManager:HabboWindowManagerComponent;

        public function SimpleAlertDialog(_arg_1:HabboWindowManagerComponent, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String, _arg_7:_SafeStr_24, _arg_8:String, _arg_9:Function, _arg_10:Function)
        {
            var _local_12:* = null;
            super();
            _SafeStr_5276 = _arg_9;
            _SafeStr_5274 = _arg_10;
            _windowManager = _arg_1;
            var _local_14:IAsset = _arg_1.assets.getAssetByName("simple_alert_xml");
            _SafeStr_4003 = _arg_1.buildModalDialogFromXML((_local_14.content as XML));
            _window = _SafeStr_3133(_SafeStr_4003.rootWindow);
            _SafeStr_4162 = IItemListWindow(_window.findChildByName("list"));
            _SafeStr_5277 = IItemListWindow(_window.findChildByName("list_top"));
            _SafeStr_5278 = IItemListWindow(_window.findChildByName("list_bottom"));
            _SafeStr_5270 = _window.findChildByName("message");
            _SafeStr_5271 = _window.findChildByName("subtitle");
            _SafeStr_5272 = ITextLinkWindow(_window.findChildByName("link"));
            _SafeStr_5273 = IStaticBitmapWrapperWindow(_window.findChildByName("illustration"));
            _window.findChildByName("header_button_close").dispose();
            _window.procedure = windowProcedure;
            _window.caption = _arg_2;
            _SafeStr_5270.caption = _arg_4;
            if (_arg_7 != null)
            {
                for each (var _local_13:String in [_arg_2, _arg_3, _arg_4, _arg_5])
                {
                    if ((((!(_local_13 == null)) && (_local_13.substr(0, 2) == "${")) && (_local_13.indexOf("}") > 0)))
                    {
                        _local_12 = _local_13.substring(2, _local_13.indexOf("}"));
                        for (var _local_11:String in _arg_7)
                        {
                            _arg_1.localization.registerParameter(_local_12, _local_11, _arg_7.getValue(_local_11));
                        };
                    };
                };
            };
            if (((!(_arg_3 == null)) && (!(_arg_3 == ""))))
            {
                _SafeStr_5271.caption = _arg_3;
            }
            else
            {
                _SafeStr_5271.dispose();
                _SafeStr_5271 = null;
            };
            _arg_6 = _arg_1.interpolate(_arg_6);
            if ((((!(_arg_5 == null)) && (!(_arg_5 == ""))) && (((!(_arg_6 == null)) && (!(_arg_6 == ""))) || (!(_arg_9 == null)))))
            {
                _SafeStr_5272.caption = _arg_5;
                _SafeStr_5272.addEventListener("WME_CLICK", onSimpleAlertClick);
                _SafeStr_5272.immediateClickMode = true;
                _SafeStr_5275 = _arg_6;
            }
            else
            {
                _SafeStr_5272.dispose();
                _SafeStr_5272 = null;
            };
            if (((!(_arg_8 == null)) && (!(_arg_8 == ""))))
            {
                _SafeStr_5273.addEventListener("WE_RESIZED", onIllustrationResized);
                _SafeStr_5273.assetUri = _arg_8;
            }
            else
            {
                _SafeStr_5273.dispose();
                _SafeStr_5273 = null;
            };
            resizeWindow();
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                close();
                _windowManager = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function close():void
        {
            if (_SafeStr_5274 != null)
            {
                (_SafeStr_5274());
            };
            if (_SafeStr_4003 != null)
            {
                if (_SafeStr_5272 != null)
                {
                    _SafeStr_5272.removeEventListener("WME_CLICK", onSimpleAlertClick);
                    _SafeStr_5272 = null;
                };
                if (_SafeStr_5273)
                {
                    _SafeStr_5273.removeEventListener("WE_RESIZED", onIllustrationResized);
                    _SafeStr_5273 = null;
                };
                _window = null;
                _SafeStr_4162 = null;
                _SafeStr_5277 = null;
                _SafeStr_5278 = null;
                _SafeStr_5270 = null;
                _SafeStr_5271 = null;
                _SafeStr_5276 = null;
                _SafeStr_5274 = null;
                _SafeStr_4003.dispose();
                _SafeStr_4003 = null;
            };
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((_arg_1.type == "WME_CLICK") && (_arg_2.name == "close_button")))
            {
                dispose();
            };
        }

        private function onSimpleAlertClick(_arg_1:WindowMouseEvent):void
        {
            if (((!(_SafeStr_5275 == null)) && (_SafeStr_5275.length > 0)))
            {
                if (_SafeStr_5275.substr(0, 6) == "event:")
                {
                    _windowManager.context.createLinkEvent(_SafeStr_5275.substr(6));
                    dispose();
                }
                else
                {
                    HabboWebTools.openWebPage(_SafeStr_5275, "habboMain");
                };
            }
            else
            {
                if (_SafeStr_5276 != null)
                {
                    (_SafeStr_5276());
                    dispose();
                };
            };
        }

        private function onIllustrationResized(_arg_1:_SafeStr_3116):void
        {
            _SafeStr_5277.x = (_SafeStr_5273.width + 10);
            _SafeStr_5278.width = _SafeStr_5277.right;
            _window.width = (_SafeStr_5277.right + (2 * 10));
            _SafeStr_5277.limits.minHeight = (_SafeStr_5273.height + 10);
            resizeWindow();
        }

        private function resizeWindow():void
        {
            _SafeStr_5277.arrangeListItems();
            _SafeStr_5278.arrangeListItems();
            _SafeStr_4162.arrangeListItems();
            _window.height = (_SafeStr_4162.height + 40);
            _window.center();
        }


    }
}//package com.sulake.habbo.window.utils

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_4003 = "_-Qd" (String#802, DoABC#4)
// _SafeStr_4162 = "_-CL" (String#282, DoABC#4)
// _SafeStr_5270 = "_-Co" (String#13225, DoABC#4)
// _SafeStr_5271 = "_-C1d" (String#8637, DoABC#4)
// _SafeStr_5272 = "_-Bm" (String#2658, DoABC#4)
// _SafeStr_5273 = "_-i1" (String#5309, DoABC#4)
// _SafeStr_5274 = "_-B1r" (String#10805, DoABC#4)
// _SafeStr_5275 = "_-J1N" (String#2314, DoABC#4)
// _SafeStr_5276 = "_-yo" (String#11406, DoABC#4)
// _SafeStr_5277 = "_-T1M" (String#7370, DoABC#4)
// _SafeStr_5278 = "_-L3" (String#11118, DoABC#4)


