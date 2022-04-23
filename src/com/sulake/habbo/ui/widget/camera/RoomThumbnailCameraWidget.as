// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.ui.widget.camera.RoomThumbnailCameraWidget

package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import com.sulake.core.runtime._SafeStr_41;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.ui.RoomUI;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.runtime._SafeStr_20;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets._SafeStr_21;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.habbo.localization._SafeStr_18;
    import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
    import com.sulake.habbo.ui.handler.RoomThumbnailCameraWidgetHandler;
    import com.sulake.habbo.room.IRoomEngine;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class RoomThumbnailCameraWidget extends RoomWidgetBase implements _SafeStr_41, ILinkEventTracker 
    {

        private var _SafeStr_4147:RoomUI;
        private var _window:_SafeStr_3263 = null;
        private var _SafeStr_4146:_SafeStr_3264;

        public function RoomThumbnailCameraWidget(_arg_1:IRoomWidgetHandler, _arg_2:_SafeStr_1695, _arg_3:_SafeStr_21, _arg_4:_SafeStr_19, _arg_5:_SafeStr_18, _arg_6:RoomUI)
        {
            super(_arg_1, _arg_2, _arg_3, _arg_5);
            _SafeStr_4147 = _arg_6;
            this.handler.widget = this;
            if (roomEngine)
            {
                roomEngine.events.addEventListener("REE_DISPOSED", onRoomDisposed);
                roomEngine.events.addEventListener("REE_ROOM_ZOOMED", onRoomZoomed);
            };
            (_arg_2 as _SafeStr_20).context.addLinkEventTracker(this);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            (windowManager as _SafeStr_20).context.removeLinkEventTracker(this);
            super.dispose();
        }

        public function get container():IRoomWidgetHandlerContainer
        {
            return ((handler) ? handler.container : null);
        }

        public function get handler():RoomThumbnailCameraWidgetHandler
        {
            return (_SafeStr_3914 as RoomThumbnailCameraWidgetHandler);
        }

        public function get roomEngine():IRoomEngine
        {
            return ((container) ? container.roomEngine : null);
        }

        public function update(_arg_1:uint):void
        {
            var _local_2:* = null;
            var _local_3:* = null;
            var _local_4:* = null;
            if (((_window) && (_SafeStr_4146)))
            {
                if (_SafeStr_4146.bitmap == null)
                {
                    _SafeStr_4146.bitmap = new BitmapData(_SafeStr_4146.width, _SafeStr_4146.height, false, 0);
                };
                _SafeStr_4146.bitmap.fillRect(_SafeStr_4146.bitmap.rect, handler.roomDesktop.roomBackgroundColor);
                _local_2 = new Point(0, 0);
                _SafeStr_4146.getGlobalPosition(_local_2);
                _local_3 = new Matrix();
                _local_3.translate(-(_local_2.x), -(_local_2.y));
                _local_4 = container.roomSession;
                roomEngine.snapshotRoomCanvasToBitmap(_local_4.roomId, container.getFirstCanvasId(), _SafeStr_4146.bitmap, _local_3, false);
                _SafeStr_4146.invalidate();
            };
        }

        public function startTakingPhoto():void
        {
            if (((roomEngine) && (!(roomEngine.getRoomCanvasScale() == 1))))
            {
                windowManager.alert("Camera only works on normal zoom!", "Return to normal zoom level and try again!", 0, null);
                return;
            };
            if (!_window)
            {
                createWindow();
            };
        }

        private function createWindow():void
        {
            if (_window)
            {
                destroy();
            };
            _window = _SafeStr_3263(windowManager.buildFromXML(XML(_SafeStr_4147.assets.getAssetByName("iro_room_thumbnail_camera_xml").content)));
            _SafeStr_4146 = _SafeStr_3264(_window.findChildByName("viewfinder"));
            _window.procedure = windowProcedure;
            _window.center();
            _SafeStr_4147.registerUpdateReceiver(this, 10);
        }

        public function destroy():void
        {
            if (_window)
            {
                _window.destroy();
                _window = null;
                _SafeStr_4147.removeUpdateReceiver(this);
            };
        }

        public function get viewPort():Rectangle
        {
            var _local_1:Point = new Point(0, 0);
            _SafeStr_4146.getGlobalPosition(_local_1);
            return (new Rectangle(_local_1.x, _local_1.y, _SafeStr_4146.width, _SafeStr_4146.height));
        }

        private function onRoomDisposed(_arg_1:RoomEngineEvent):void
        {
            destroy();
        }

        private function onRoomZoomed(_arg_1:RoomEngineEvent):void
        {
            if (((roomEngine) && (!(roomEngine.getRoomCanvasScale() == 1))))
            {
                destroy();
            };
        }

        public function triggerCameraShutterSound():void
        {
            container.soundManager.playSound("CAMERA_shutter");
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            var _local_3:* = null;
            var _local_4:WindowMouseEvent = (_arg_1 as WindowMouseEvent);
            if (((_local_4) && (_local_4.type == "WME_CLICK")))
            {
                switch (_arg_2.name)
                {
                    case "button_capture":
                        triggerCameraShutterSound();
                        _local_3 = RoomThumbnailCameraWidgetHandler(handler).collectPhotoData();
                        if (((!(_local_3 == null)) && (_local_3.isSendable())))
                        {
                            handler.sendPhotoData(_local_3);
                            _window.findChildByName("button_capture").disable();
                            _window.findChildByName("button_cancel").disable();
                            _SafeStr_4147.removeUpdateReceiver(this);
                        }
                        else
                        {
                            windowManager.alert("${generic.alert.title}", "${camera.alert.too_much_stuff}", 0, null);
                        };
                        return;
                    case "header_button_close":
                    case "button_cancel":
                        destroy();
                        return;
                };
            };
        }

        public function get linkPattern():String
        {
            return ("roomThumbnailCamera");
        }

        public function linkReceived(_arg_1:String):void
        {
            var _local_2:Array = _arg_1.split("/");
            var _local_3:int = _local_2.length;
            if (_local_3 < 2)
            {
                return;
            };
            if (_local_2[1] == "open")
            {
                startTakingPhoto();
            };
        }


    }
}//package com.sulake.habbo.ui.widget.camera

// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_18 = "_-61x" (String#484, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_20 = "_-W1o" (String#542, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3914 = "_-w1m" (String#1204, DoABC#4)
// _SafeStr_41 = "_-m5" (String#2087, DoABC#4)
// _SafeStr_4146 = "_-2x" (String#1939, DoABC#4)
// _SafeStr_4147 = "_-Q1a" (String#196, DoABC#4)
// _SafeStr_688 = "_-Ep" (String#13442, DoABC#4)


