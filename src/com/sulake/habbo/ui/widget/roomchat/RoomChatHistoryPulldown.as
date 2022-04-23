﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.roomchat.RoomChatHistoryPulldown

package com.sulake.habbo.ui.widget.roomchat
{
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.assets._SafeStr_21;
    import flash.display.BitmapData;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.geom.Rectangle;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class RoomChatHistoryPulldown 
    {

        public static const STATE_FADE_OUT:int = 3;
        public static const STATE_FADE_IN:int = 2;
        public static const STATE_VISIBLE:int = 1;
        public static const STATE_HIDDEN:int = 0;
        public static const PULLDOWN_WINDOW_HEIGHT:int = 39;
        private static const FADE_OUT_MS:int = 150;
        private static const FADE_IN_MS:int = 250;

        private var _SafeStr_4981:RoomChatWidget;
        private var _windowManager:_SafeStr_1695;
        private var _window:_SafeStr_3133;
        private var _SafeStr_6358:_SafeStr_3264;
        private var _SafeStr_4585:_SafeStr_3133;
        private var _region:IRegionWindow;
        private var _SafeStr_3745:_SafeStr_21;
        private var _lastWidth:int = 0;
        private var _SafeStr_3734:int = -1;
        private var _SafeStr_6361:BitmapData;
        private var _SafeStr_6362:BitmapData;
        private var _SafeStr_6359:BitmapData;
        private var _SafeStr_6360:BitmapData;
        private var _SafeStr_6364:BitmapData;
        private var _SafeStr_6365:BitmapData;
        private var _SafeStr_6363:BitmapData;
        private var _regionRightMargin:int = 30;

        public function RoomChatHistoryPulldown(_arg_1:RoomChatWidget, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_3133, _arg_4:_SafeStr_21)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_2;
            _SafeStr_3745 = _arg_4;
            _SafeStr_4585 = _arg_3;
            _SafeStr_6361 = ((_SafeStr_3745.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData);
            _SafeStr_6362 = ((_SafeStr_3745.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData);
            _SafeStr_6359 = ((_SafeStr_3745.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData);
            _SafeStr_6360 = ((_SafeStr_3745.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData);
            _SafeStr_6364 = ((_SafeStr_3745.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData);
            _SafeStr_6365 = ((_SafeStr_3745.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData);
            _SafeStr_6363 = ((_SafeStr_3745.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData);
            _SafeStr_6358 = (_windowManager.createWindow("chat_history_bg", "", 21, 0, 16, new Rectangle(0, 0, _arg_3.width, (_arg_3.height - 39)), null, 0, 0) as _SafeStr_3264);
            _SafeStr_4585.addChild(_SafeStr_6358);
            _window = (_windowManager.createWindow("chat_pulldown", "", 4, 0, (0x01 | 0x10), new Rectangle(0, (_SafeStr_4585.height - 39), _arg_3.width, 39), null, 0) as _SafeStr_3133);
            _SafeStr_4585.addChild(_window);
            _region = (_windowManager.createWindow("REGIONchat_pulldown", "", 5, 0, (((0x01 | 0x10) | 0x00) | 0x00), new Rectangle(0, 0, _arg_3.width, (_arg_3.height - 39)), null, 0) as IRegionWindow);
            if (_region != null)
            {
                _region.background = true;
                _region.mouseThreshold = 0;
                _region.addEventListener("WME_DOWN", onPulldownMouseDown);
                _SafeStr_4585.addChild(_region);
                _region.toolTipCaption = "${chat.history.drag.tooltip}";
                _region.toolTipDelay = 250;
            };
            var _local_6:XmlAsset = (_arg_4.getAssetByName("chat_history_pulldown") as XmlAsset);
            _window.buildFromXML((_local_6.content as XML));
            _window.addEventListener("WME_DOWN", onPulldownMouseDown);
            var _local_5:_SafeStr_3264 = (_window.findChildByName("GrapBarX") as _SafeStr_3264);
            if (_local_5 != null)
            {
                _local_5.mouseThreshold = 0;
                _local_5.addEventListener("WME_CLICK", onCloseButtonClicked);
                _local_5.addEventListener("WME_UP", onCloseButtonMouseUp);
                _local_5.addEventListener("WME_DOWN", onCloseButtonMouseDown);
                _local_5.addEventListener("WME_OVER", onCloseButtonMouseOver);
                _local_5.addEventListener("WME_OUT", onCloseButtonMouseOut);
            };
            _window.background = true;
            _window.color = 0;
            _window.mouseThreshold = 0;
            this.state = 0;
            buildWindowGraphics();
        }

        public function dispose():void
        {
            if (_region != null)
            {
                _region.dispose();
                _region = null;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            if (_SafeStr_6358 != null)
            {
                _SafeStr_6358.dispose();
                _SafeStr_6358 = null;
            };
        }

        public function update(_arg_1:uint):void
        {
            switch (state)
            {
                case 2:
                    _SafeStr_6358.blend = (_SafeStr_6358.blend + (_arg_1 / 250));
                    _window.blend = (_window.blend + (_arg_1 / 250));
                    if (_window.blend >= 1)
                    {
                        state = 1;
                    };
                    return;
                case 3:
                    _SafeStr_6358.blend = (_SafeStr_6358.blend - (_arg_1 / 150));
                    _window.blend = (_window.blend - (_arg_1 / 150));
                    if (_window.blend <= 0)
                    {
                        state = 0;
                    };
                default:
            };
        }

        public function set state(_arg_1:int):void
        {
            if (_arg_1 == _SafeStr_3734)
            {
                return;
            };
            switch (_arg_1)
            {
                case 1:
                    if (_SafeStr_3734 == 0)
                    {
                        this.state = 2;
                    }
                    else
                    {
                        if (((_window == null) || (_SafeStr_6358 == null)))
                        {
                            return;
                        };
                        _window.visible = true;
                        _SafeStr_6358.visible = true;
                        _region.visible = true;
                        _SafeStr_3734 = _arg_1;
                    };
                    return;
                case 0:
                    if (((_window == null) || (_SafeStr_6358 == null)))
                    {
                        return;
                    };
                    _window.visible = false;
                    _SafeStr_6358.visible = false;
                    _region.visible = false;
                    _SafeStr_3734 = _arg_1;
                    return;
                case 2:
                    if (((_window == null) || (_SafeStr_6358 == null)))
                    {
                        return;
                    };
                    _window.blend = 0;
                    _SafeStr_6358.blend = 0;
                    _window.visible = true;
                    _SafeStr_6358.visible = true;
                    _SafeStr_3734 = _arg_1;
                    return;
                case 3:
                    if (((_window == null) || (_SafeStr_6358 == null)))
                    {
                        return;
                    };
                    _window.blend = 1;
                    _SafeStr_6358.blend = 1;
                    _SafeStr_3734 = _arg_1;
                default:
            };
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function containerResized(_arg_1:Rectangle):void
        {
            if (_window != null)
            {
                _window.x = 0;
                _window.y = (_SafeStr_4585.height - 39);
                _window.width = _SafeStr_4585.width;
            };
            if (_region != null)
            {
                _region.x = 0;
                _region.y = (_SafeStr_4585.height - 39);
                _region.width = (_SafeStr_4585.width - _regionRightMargin);
            };
            if (_SafeStr_6358 != null)
            {
                _SafeStr_6358.rectangle = _SafeStr_4585.rectangle;
                _SafeStr_6358.height = (_SafeStr_6358.height - 39);
            };
            buildWindowGraphics();
        }

        private function buildWindowGraphics():void
        {
            var _local_12:int;
            var _local_2:int;
            var _local_7:* = null;
            var _local_3:* = null;
            var _local_5:* = null;
            if (_window == null)
            {
                return;
            };
            if (_lastWidth == _window.width)
            {
                return;
            };
            _lastWidth = _window.width;
            var _local_6:_SafeStr_3264 = (_window.findChildByName("grapBarBg") as _SafeStr_3264);
            var _local_8:_SafeStr_3264 = (_window.findChildByName("GrapBarX") as _SafeStr_3264);
            var _local_1:_SafeStr_3264 = (_window.findChildByName("grapBarGripL") as _SafeStr_3264);
            var _local_9:_SafeStr_3264 = (_window.findChildByName("grapBarGripR") as _SafeStr_3264);
            var _local_4:_SafeStr_3264 = (_window.findChildByName("grapBarHandle") as _SafeStr_3264);
            var _local_11:int = 5;
            if (((!(_local_8 == null)) && (!(_local_4 == null))))
            {
                _local_4.bitmap = _SafeStr_6359;
                _local_4.disposesBitmap = false;
                _local_8.bitmap = _SafeStr_6360;
                _local_8.disposesBitmap = false;
                _regionRightMargin = (_window.width - _local_8.x);
            };
            _local_1.width = (_local_4.x - _local_11);
            _local_1.x = 0;
            _local_9.x = ((_local_4.x + _local_4.width) + _local_11);
            _local_9.width = ((_local_8.x - _local_11) - _local_9.x);
            if (_local_1.width < 0)
            {
                _local_1.width = 0;
            };
            if (_local_9.width < 0)
            {
                _local_9.width = 0;
            };
            var _local_10:int;
            if ((((!(_local_6 == null)) && (!(_local_1 == null))) && (!(_local_9 == null))))
            {
                try
                {
                    _local_10 = 1;
                    _local_2 = _local_6.width;
                    _local_12 = _local_6.height;
                    if (((_local_2 > 0) && (_local_12 > 0)))
                    {
                        _local_7 = new TrackedBitmapData(this, _local_2, _local_12);
                        tileBitmapHorz(_SafeStr_6361, _local_7);
                        _local_6.disposesBitmap = true;
                        _local_6.bitmap = _local_7;
                    };
                    _local_10 = 2;
                    _local_2 = _local_1.width;
                    _local_12 = _local_1.height;
                    if (((_local_2 > 0) && (_local_12 > 0)))
                    {
                        _local_3 = new TrackedBitmapData(this, _local_2, _local_12);
                        tileBitmapHorz(_SafeStr_6362, _local_3);
                        _local_1.disposesBitmap = true;
                        _local_1.bitmap = _local_3;
                    };
                    _local_10 = 3;
                    _local_2 = _local_9.width;
                    _local_12 = _local_9.height;
                    if (((_local_2 > 0) && (_local_12 > 0)))
                    {
                        _local_5 = new TrackedBitmapData(this, _local_2, _local_12);
                        tileBitmapHorz(_SafeStr_6362, _local_5);
                        _local_9.disposesBitmap = true;
                        _local_9.bitmap = _local_5;
                    };
                }
                catch(e:Error)
                {
                    throw (new Error(((((((e.message + " width:") + _local_2) + " height:") + _local_12) + " state:") + _local_10), e.errorID));
                };
            };
            if (_SafeStr_6358 == null)
            {
                return;
            };
            _SafeStr_6358.bitmap = _SafeStr_6363;
            _SafeStr_6358.disposesBitmap = false;
        }

        private function tileBitmapHorz(_arg_1:BitmapData, _arg_2:BitmapData):void
        {
            var _local_4:int;
            var _local_3:int = int((_arg_2.width / _arg_1.width));
            var _local_5:Point = new Point();
            _local_4 = 0;
            while (_local_4 < (_local_3 + 1))
            {
                _local_5.x = (_local_4 * _arg_1.width);
                _arg_2.copyPixels(_arg_1, _arg_1.rect, _local_5);
                _local_4++;
            };
        }

        private function onPulldownMouseDown(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.onPulldownMouseDown(_arg_1);
            };
        }

        private function onCloseButtonClicked(_arg_1:WindowMouseEvent):void
        {
            if (_SafeStr_4981 != null)
            {
                _SafeStr_4981.onPulldownCloseButtonClicked(_arg_1);
            };
        }

        private function onCloseButtonMouseOver(_arg_1:WindowMouseEvent):void
        {
            if (_window == null)
            {
                return;
            };
            if (!_window.visible)
            {
                return;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("GrapBarX") as _SafeStr_3264);
            if (_local_2 != null)
            {
                _local_2.disposesBitmap = false;
                _local_2.bitmap = _SafeStr_6364;
            };
        }

        private function onCloseButtonMouseOut(_arg_1:WindowMouseEvent):void
        {
            if (_window == null)
            {
                return;
            };
            if (!_window.visible)
            {
                return;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("GrapBarX") as _SafeStr_3264);
            if (_local_2 != null)
            {
                _local_2.disposesBitmap = false;
                _local_2.bitmap = _SafeStr_6360;
            };
        }

        private function onCloseButtonMouseDown(_arg_1:WindowMouseEvent):void
        {
            if (_window == null)
            {
                return;
            };
            if (!_window.visible)
            {
                return;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("GrapBarX") as _SafeStr_3264);
            if (_local_2 != null)
            {
                _local_2.disposesBitmap = false;
                _local_2.bitmap = _SafeStr_6365;
            };
        }

        private function onCloseButtonMouseUp(_arg_1:WindowMouseEvent):void
        {
            if (_window == null)
            {
                return;
            };
            if (!_window.visible)
            {
                return;
            };
            var _local_2:_SafeStr_3264 = (_window.findChildByName("GrapBarX") as _SafeStr_3264);
            if (_local_2 != null)
            {
                _local_2.disposesBitmap = false;
                _local_2.bitmap = _SafeStr_6364;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.roomchat

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3734 = "_-g1U" (String#198, DoABC#4)
// _SafeStr_3745 = "_-4b" (String#920, DoABC#4)
// _SafeStr_4585 = "_-ZD" (String#1375, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_6358 = "_-51o" (String#2929, DoABC#4)
// _SafeStr_6359 = "_-F1Z" (String#18669, DoABC#4)
// _SafeStr_6360 = "_-Y1Y" (String#15124, DoABC#4)
// _SafeStr_6361 = "_-m7" (String#18206, DoABC#4)
// _SafeStr_6362 = "_-k" (String#13838, DoABC#4)
// _SafeStr_6363 = "_-C1y" (String#18042, DoABC#4)
// _SafeStr_6364 = "_-024" (String#14397, DoABC#4)
// _SafeStr_6365 = "_-M1H" (String#22400, DoABC#4)


