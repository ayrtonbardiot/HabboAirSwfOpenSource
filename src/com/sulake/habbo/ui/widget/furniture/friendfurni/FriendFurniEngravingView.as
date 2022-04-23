// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.furniture.friendfurni.FriendFurniEngravingView

package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.components._SafeStr_3189;
    import flash.display.Bitmap;
    import com.sulake.core.window._SafeStr_3109;
    import flash.errors.IllegalOperationError;
    import com.sulake.core.window.events._SafeStr_3116;

    public class FriendFurniEngravingView implements _SafeStr_1875, _SafeStr_13 
    {

        private var _SafeStr_4601:StringArrayStuffData;
        private var _SafeStr_4981:FriendFurniEngravingWidget;
        private var _window:_SafeStr_3133 = null;
        private var _disposed:Boolean = false;

        public function FriendFurniEngravingView(_arg_1:FriendFurniEngravingWidget, _arg_2:StringArrayStuffData)
        {
            _SafeStr_4981 = _arg_1;
            _SafeStr_4601 = _arg_2;
        }

        private static function setElementImage(_arg_1:_SafeStr_3109, _arg_2:BitmapData, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0):void
        {
            var _local_9:* = null;
            var _local_6:* = null;
            if (_arg_2 == null)
            {
                return;
            };
            if (_arg_1 == null)
            {
                return;
            };
            if (_arg_1.disposed)
            {
                return;
            };
            var _local_10:int = ((_arg_3 > 0) ? _arg_3 : _arg_1.height);
            var _local_7:int = int((((_arg_1.width - _arg_2.width) / 2) + _arg_4));
            var _local_8:int = int((((_local_10 - _arg_2.height) / 2) + _arg_5));
            if ((_arg_1 as _SafeStr_3264) != null)
            {
                _local_9 = _SafeStr_3264(_arg_1);
                if (((_local_9.bitmap == null) || (_arg_3 > 0)))
                {
                    _local_9.bitmap = new BitmapData(_arg_1.width, _local_10, true, 0);
                };
                _local_9.bitmap.fillRect(_local_9.bitmap.rect, 0);
                _local_9.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_7, _local_8), null, null, false);
                _arg_1.invalidate();
            }
            else
            {
                if ((_arg_1 as _SafeStr_3189) != null)
                {
                    _local_6 = _SafeStr_3189(_arg_1);
                    _local_6.setDisplayObject(new Bitmap(_arg_2));
                };
            };
        }


        protected function get stuffData():StringArrayStuffData
        {
            return (_SafeStr_4601);
        }

        protected function get widget():FriendFurniEngravingWidget
        {
            return (_SafeStr_4981);
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function dispose():void
        {
            if (!disposed)
            {
                destroyWindow();
                _SafeStr_4981 = null;
                _SafeStr_4601 = null;
                _disposed = true;
            };
        }

        public function open():void
        {
            createWindow();
        }

        public function close():void
        {
            destroyWindow();
        }

        protected function assetName():String
        {
            throw (new IllegalOperationError("Must implement in concrete view!"));
        }

        private function createWindow():void
        {
            var _local_2:* = null;
            var _local_1:* = null;
            if (!_window)
            {
                _window = _SafeStr_3133(widget.windowManager.buildFromXML(XML(widget.assets.getAssetByName(assetName()).content)));
                _window.procedure = windowProc;
                _window.center();
                _window.findChildByName("name_left").caption = stuffData.getValue(1);
                _window.findChildByName("name_right").caption = stuffData.getValue(2);
                _window.findChildByName("date").caption = stuffData.getValue(5);
                _local_2 = widget.engravingWidgetHandler.container.avatarRenderManager.createAvatarImage(stuffData.getValue(3), "h", null, this);
                _local_1 = widget.engravingWidgetHandler.container.avatarRenderManager.createAvatarImage(stuffData.getValue(4), "h", null, this);
                if (!_local_2.isPlaceholder())
                {
                    setAvatarImage("avatar_left", _local_2.getCroppedImage("full"));
                };
                if (!_local_1.isPlaceholder())
                {
                    _local_1.setDirection("full", 4);
                    setAvatarImage("avatar_right", _local_1.getCroppedImage("full"));
                };
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            if (_arg_1 == stuffData.getValue(3))
            {
                _local_3 = widget.engravingWidgetHandler.container.avatarRenderManager.createAvatarImage(stuffData.getValue(3), "h", null, this);
                setAvatarImage("avatar_left", _local_3.getCroppedImage("full"));
            };
            if (_arg_1 == stuffData.getValue(4))
            {
                _local_2 = widget.engravingWidgetHandler.container.avatarRenderManager.createAvatarImage(stuffData.getValue(4), "h", null, this);
                _local_2.setDirection("full", 4);
                setAvatarImage("avatar_right", _local_2.getCroppedImage("full"));
            };
        }

        private function setAvatarImage(_arg_1:String, _arg_2:BitmapData):void
        {
            var _local_3:_SafeStr_3264 = _SafeStr_3264(_window.findChildByName(_arg_1));
            setElementImage(_local_3, _arg_2, 0, 0, 0);
        }

        private function destroyWindow():void
        {
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        private function windowProc(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        widget.close(widget.stuffId);
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.ui.widget.furniture.friendfurni

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4601 = "_-o1B" (String#1746, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)


