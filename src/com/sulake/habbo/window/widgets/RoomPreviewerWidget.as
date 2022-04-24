// by nota

//com.sulake.habbo.window.widgets.RoomPreviewerWidget

package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components._SafeStr_3189;
    import com.sulake.habbo.room.preview.RoomPreviewer;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import flash.geom.Point;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.display.Bitmap;
    import flash.display.BitmapData;

    public class RoomPreviewerWidget implements IRoomPreviewerWidget 
    {

        public static const TYPE:String = "room_previewer";
        private static const SCALE_KEY:String = "room_previewer:scale";
        private static const _SafeStr_9185:String = "room_previewer:offsetx";
        private static const _SafeStr_9186:String = "room_previewer:offsety";
        private static const _SafeStr_9187:String = "room_previewer:zoom";
        private static const SCALE_DEFAULT:PropertyStruct = new PropertyStruct("room_previewer:scale", 64, "int", false, [32, 64]);
        private static const OFFSET_X_DEFAULT:PropertyStruct = new PropertyStruct("room_previewer:offsetx", 0, "int", false);
        private static const OFFSET_Y_DEFAULT:PropertyStruct = new PropertyStruct("room_previewer:offsety", 0, "int", false);
        private static const ZOOM_DEFAULT:PropertyStruct = new PropertyStruct("room_previewer:zoom", 1, "int", false);

        private static var ROOM_ID_COUNTER:int = 2;

        private var _disposed:Boolean;
        private var _SafeStr_5427:_SafeStr_3199;
        private var _windowManager:HabboWindowManagerComponent;
        private var _SafeStr_5428:_SafeStr_3133;
        private var _SafeStr_6514:_SafeStr_3189;
        private var _SafeStr_3840:RoomPreviewer;
        private var _SafeStr_4045:int = SCALE_DEFAULT.value;
        private var _offsetX:int = 0;
        private var _offsetY:int = 0;
        private var _SafeStr_6513:int = ZOOM_DEFAULT.value;

        public function RoomPreviewerWidget(_arg_1:_SafeStr_3199, _arg_2:HabboWindowManagerComponent)
        {
            _SafeStr_5427 = _arg_1;
            _windowManager = _arg_2;
            if (_arg_2.roomEngine)
            {
                _arg_2.roomEngine.events.addEventListener("REE_INITIALIZED", onRoomInitialized);
            };
            _SafeStr_5428 = (_windowManager.buildFromXML((_windowManager.assets.getAssetByName("room_previewer_xml").content as XML)) as _SafeStr_3133);
            _SafeStr_6514 = (_SafeStr_5428.findChildByName("room_canvas") as _SafeStr_3189);
            _SafeStr_3840 = new RoomPreviewer(_arg_2.roomEngine, ROOM_ID_COUNTER++);
            _SafeStr_3840.createRoomForPreviews();
            _SafeStr_5428.addEventListener("WME_CLICK", onClickRoomView);
            _SafeStr_5428.addEventListener("WE_RESIZE", onResizeCanvas);
            _SafeStr_5427.rootWindow = _SafeStr_5428;
            _SafeStr_5428.width = _SafeStr_5427.width;
            _SafeStr_5428.height = _SafeStr_5427.height;
            _SafeStr_3840.modifyRoomCanvas(_SafeStr_5428.width, _SafeStr_5428.height);
        }

        public function get scale():int
        {
            return (_SafeStr_4045);
        }

        public function set scale(_arg_1:int):void
        {
            _SafeStr_4045 = _arg_1;
            refresh();
        }

        public function get offsetX():int
        {
            return (_offsetX);
        }

        public function set offsetX(_arg_1:int):void
        {
            _offsetX = _arg_1;
            refresh();
        }

        public function get offsetY():int
        {
            return (_offsetY);
        }

        public function set offsetY(_arg_1:int):void
        {
            _offsetY = _arg_1;
            refresh();
        }

        public function get zoom():int
        {
            return (_SafeStr_6513);
        }

        public function set zoom(_arg_1:int):void
        {
            _SafeStr_6513 = _arg_1;
            refresh();
        }

        public function get properties():Array
        {
            var _local_1:Array = [];
            if (_disposed)
            {
                return (_local_1);
            };
            _local_1.push(SCALE_DEFAULT.withValue(_SafeStr_4045));
            _local_1.push(OFFSET_X_DEFAULT.withValue(_offsetX));
            _local_1.push(OFFSET_Y_DEFAULT.withValue(_offsetY));
            _local_1.push(ZOOM_DEFAULT.withValue(_SafeStr_6513));
            return (_local_1);
        }

        public function set properties(_arg_1:Array):void
        {
            for each (var _local_2:PropertyStruct in _arg_1)
            {
                switch (_local_2.key)
                {
                    case "room_previewer:scale":
                        scale = _local_2.value;
                        break;
                    case "room_previewer:offsetx":
                        offsetX = _local_2.value;
                        break;
                    case "room_previewer:offsety":
                        offsetY = _local_2.value;
                        break;
                    case "room_previewer:zoom":
                        zoom = _local_2.value;
                };
            };
        }

        public function dispose():void
        {
            if (!_disposed)
            {
                if (_SafeStr_3840)
                {
                    _SafeStr_3840.dispose();
                    _SafeStr_3840 = null;
                };
                if (_SafeStr_5428 != null)
                {
                    _SafeStr_5428.dispose();
                    _SafeStr_5428 = null;
                };
                if (_SafeStr_5427 != null)
                {
                    _SafeStr_5427.rootWindow = null;
                    _SafeStr_5427 = null;
                };
                if (((_windowManager) && (_windowManager.roomEngine)))
                {
                    _windowManager.roomEngine.events.removeEventListener("REE_INITIALIZED", onRoomInitialized);
                };
                _windowManager = null;
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function get iterator():IIterator
        {
            return (EmptyIterator.INSTANCE);
        }

        private function onRoomInitialized(_arg_1:RoomEngineEvent):void
        {
            var _local_2:* = null;
            switch (_arg_1.type)
            {
                case "REE_INITIALIZED":
                    if (((_SafeStr_3840) && (_arg_1.roomId == _SafeStr_3840.previewRoomId)))
                    {
                        _SafeStr_3840.reset(false);
                        _local_2 = _SafeStr_3840.getRoomCanvas(_SafeStr_6514.width, _SafeStr_6514.height);
                        if (_local_2 != null)
                        {
                            _SafeStr_6514.setDisplayObject(_local_2);
                        };
                    };
                    return;
            };
        }

        private function refresh():void
        {
            var _local_1:* = null;
            if (((_SafeStr_3840) && (_SafeStr_3840.isRoomEngineReady)))
            {
                ((_SafeStr_4045 == 64) ? _SafeStr_3840.zoomIn() : _SafeStr_3840.zoomOut());
                _SafeStr_3840.addViewOffset = new Point(_offsetX, _offsetY);
                _local_1 = _SafeStr_6514.getDisplayObject();
                var _local_2:* = zoom;
                _local_1.scaleY = _local_2;
                _local_1.scaleX = _local_2;
                _local_1.x = offsetX;
                _local_1.y = offsetY;
            };
        }

        public function toString():String
        {
            return ("RoomPreviewerWidget");
        }

        private function onResizeCanvas(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109=null):void
        {
            var _local_3:int = _arg_1.window.width;
            var _local_4:int = _arg_1.window.height;
            _SafeStr_3840.modifyRoomCanvas(_local_3, _local_4);
        }

        private function onClickRoomView(_arg_1:WindowMouseEvent):void
        {
            _SafeStr_3840.changeRoomObjectState();
        }

        public function get roomPreviewer():RoomPreviewer
        {
            return (_SafeStr_3840);
        }

        public function showPreview(_arg_1:BitmapData):void
        {
            var _local_2:Bitmap = new Bitmap(_arg_1);
            _local_2.scaleX = 2;
            _local_2.scaleY = 2;
            _SafeStr_6514.setDisplayObject(_local_2);
        }


    }
}//package com.sulake.habbo.window.widgets

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3840 = "_-t6" (String#1593, DoABC#4)
// _SafeStr_4045 = "_-22r" (String#725, DoABC#4)
// _SafeStr_5427 = "_-h1n" (String#409, DoABC#4)
// _SafeStr_5428 = "_-L19" (String#253, DoABC#4)
// _SafeStr_6513 = "_-xd" (String#10830, DoABC#4)
// _SafeStr_6514 = "_-O1P" (String#3464, DoABC#4)
// _SafeStr_9185 = "_-H7" (String#39879, DoABC#4)
// _SafeStr_9186 = "_-22F" (String#34270, DoABC#4)
// _SafeStr_9187 = "_-98" (String#38743, DoABC#4)


