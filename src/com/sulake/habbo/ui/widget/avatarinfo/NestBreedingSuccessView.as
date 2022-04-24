// by nota

//com.sulake.habbo.ui.widget.avatarinfo.NestBreedingSuccessView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.core.utils._SafeStr_24;
    import flash.display.BitmapData;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room._SafeStr_3248;
    import com.sulake.core.window.components._SafeStr_3264;
    import flash.geom.Point;

    public class NestBreedingSuccessView implements _SafeStr_13, _SafeStr_3140 
    {

        private static const _SafeStr_8701:String = "header_button_close";
        private static const _SafeStr_8702:String = "cancel_button";
        private static const _SafeStr_8704:String = "button.ok";

        private var _window:_SafeStr_3263;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4981:AvatarInfoWidget;
        private var _windowManager:_SafeStr_1695;
        private var _assets:IAssetLibrary;
        private var _SafeStr_5316:_SafeStr_3241;
        private var _SafeStr_5431:int;
        private var _SafeStr_5989:_SafeStr_24;
        private var _SafeStr_6042:int;

        public function NestBreedingSuccessView(_arg_1:AvatarInfoWidget)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_1.windowManager;
            _assets = _SafeStr_4981.assets;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            _SafeStr_4036 = true;
            if (_window)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function open(_arg_1:int, _arg_2:int):void
        {
            _SafeStr_5431 = _arg_1;
            _SafeStr_5316 = _SafeStr_4981.handler.roomSession.userDataManager.getUserDataByIndex(_arg_1);
            if (_SafeStr_5316 == null)
            {
                _SafeStr_14.log("Couldn't find the correct pet.");
                return;
            };
            _SafeStr_6042 = _arg_2;
            setWindowContent();
            _window.visible = true;
        }

        private function setWindowContent():void
        {
            if (!_window)
            {
                _window = (_windowManager.buildFromXML((_assets.getAssetByName("nestBreedingSuccess_xml").content as XML)) as _SafeStr_3263);
                addClickListener("header_button_close");
            };
            _window.center();
            _window.visible = true;
            addClickListener("button.ok");
            _window.findChildByName("pet.name").caption = _SafeStr_5316.name;
            _window.findChildByName("pet.raritycategory").caption = (("${breedpets.nestbreeding.success.raritycategory." + _SafeStr_6042) + "}");
            var _local_1:BitmapData = resolvePreviewImage(_SafeStr_5316.figure, "pet_image");
            updatePreviewImage(((_local_1 != null) ? _local_1 : new BitmapData(10, 10)), "pet_image");
            _window.invalidate();
        }

        public function close():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }

        private function addClickListener(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onMouseClick);
            };
        }

        private function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "cancel_button":
                    close();
                    return;
                case "button.ok":
                    close();
                    return;
            };
        }

        private function resolvePreviewImage(_arg_1:String, _arg_2:String, _arg_3:int=64):BitmapData
        {
            var _local_8:* = null;
            var _local_7:int;
            var _local_4:PetFigureData = new PetFigureData(_arg_1);
            var _local_5:String = "std";
            var _local_6:_SafeStr_3248 = _SafeStr_4981.handler.roomEngine.getPetImage(_local_4.typeId, _local_4.paletteId, _local_4.color, new Vector3d(90), _arg_3, this, true, 0, _local_4.customParts, _local_5);
            if (_local_6 != null)
            {
                _local_7 = _local_6.id;
                if (_local_7 > 0)
                {
                    _SafeStr_5989.add(_local_7, _arg_2);
                };
                _local_8 = _local_6.data;
            };
            return (_local_8);
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            if (disposed)
            {
                return;
            };
            var _local_3:String = _SafeStr_5989.getValue(_arg_1);
            if (_local_3 != null)
            {
                updatePreviewImage(_arg_2, _local_3);
            };
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function updatePreviewImage(_arg_1:BitmapData, _arg_2:String):void
        {
            if (((!(_window)) || (!(_arg_1))))
            {
                return;
            };
            var _local_4:_SafeStr_3264 = (_window.findChildByName(_arg_2) as _SafeStr_3264);
            _local_4.bitmap = new BitmapData(_local_4.width, _local_4.height, true, 0xFFFFFF);
            var _local_3:Point = new Point(((_local_4.width - _arg_1.width) / 2), ((_local_4.height - _arg_1.height) / 2));
            _local_4.bitmap.copyPixels(_arg_1, _arg_1.rect, _local_3, null, null, true);
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_14 = "_-ED" (String#155, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3241 = "_-O1A" (String#764, DoABC#4)
// _SafeStr_3248 = "_-u1i" (String#807, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4981 = "_-o1H" (String#37, DoABC#4)
// _SafeStr_5316 = "_-k1l" (String#1416, DoABC#4)
// _SafeStr_5431 = "_-GK" (String#1818, DoABC#4)
// _SafeStr_5989 = "_-o1c" (String#2112, DoABC#4)
// _SafeStr_6042 = "_-xC" (String#9475, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8702 = "_-H1q" (String#14548, DoABC#4)
// _SafeStr_8704 = "_-vm" (String#6712, DoABC#4)


