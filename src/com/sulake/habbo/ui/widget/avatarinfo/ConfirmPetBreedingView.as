// by nota

//com.sulake.habbo.ui.widget.avatarinfo.ConfirmPetBreedingView

package com.sulake.habbo.ui.widget.avatarinfo
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.session._SafeStr_3241;
    import com.sulake.habbo.avatar.pets.PetFigureData;
    import com.sulake.room.utils.Vector3d;
    import com.sulake.habbo.room._SafeStr_3248;
    import flash.display.BitmapData;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.habbo.ui.widget.events.BreedingRarityCategoryData;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import flash.geom.Point;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class ConfirmPetBreedingView implements _SafeStr_13, _SafeStr_3140 
    {

        private static const ELEM_LIST:String = "element_list";
        private static const PREVIEW_LIST:String = "preview_list";
        private static const ELEM_PET1_ITEMLIST:String = "pet1_itemlist";
        private static const ELEM_PET2_ITEMLIST:String = "pet2_itemlist";
        private static const _SafeStr_8953:String = "description";
        private static const ELEM_REQUEST:String = "request";
        private static const _SafeStr_8701:String = "header_button_close";
        private static const _SafeStr_8703:String = "save_button";
        private static const _SafeStr_8954:String = "accept_button";
        private static const _SafeStr_8702:String = "cancel_button";
        private static const _SafeStr_8704:String = "ok_button";
        private static const BUTTON_LIST:String = "button_list";

        private var _window:_SafeStr_3263;
        private var _SafeStr_4036:Boolean = false;
        private var _SafeStr_4981:AvatarInfoWidget;
        private var _windowManager:_SafeStr_1695;
        private var _assets:IAssetLibrary;
        private var _SafeStr_5989:_SafeStr_24;
        private var _SafeStr_5539:int;
        private var _SafeStr_5540:int;
        private var _SafeStr_5316:_SafeStr_3241;
        private var _petData2:_SafeStr_3241;
        private var _SafeStr_8959:Boolean = false;
        private var _stuffId:int;
        private var _SafeStr_5997:Array;
        private var _SafeStr_5999:int;

        public function ConfirmPetBreedingView(_arg_1:AvatarInfoWidget)
        {
            _SafeStr_4981 = _arg_1;
            _windowManager = _arg_1.windowManager;
            _assets = _SafeStr_4981.assets;
            _SafeStr_5989 = new _SafeStr_24();
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
            if (_SafeStr_5989 != null)
            {
                _SafeStr_5989.dispose();
            };
            _SafeStr_5989 = null;
        }

        public function get requestRoomObjectId():int
        {
            return (_SafeStr_5539);
        }

        public function get targetRoomObjectId():int
        {
            return (_SafeStr_5540);
        }

        public function open(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Array, _arg_5:int, _arg_6:int, _arg_7:int):void
        {
            _SafeStr_5539 = _arg_1;
            _SafeStr_5540 = _arg_2;
            _SafeStr_5316 = _SafeStr_4981.handler.roomSession.userDataManager.getUserDataByIndex(_arg_1);
            _petData2 = _SafeStr_4981.handler.roomSession.userDataManager.getUserDataByIndex(_arg_2);
            _SafeStr_5316.petLevel = _arg_6;
            _petData2.petLevel = _arg_7;
            _SafeStr_5997 = _arg_4;
            _SafeStr_5999 = _arg_5;
            _stuffId = _arg_3;
            setWindowContent();
            _window.visible = true;
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

        private function setWindowContent():void
        {
            var _local_8:* = null;
            var _local_1:* = null;
            var _local_5:* = null;
            _SafeStr_4981.localizations.registerParameter("breedpets.widget.title", "name", _SafeStr_5316.name);
            _SafeStr_4981.localizations.registerParameter("breedpets.widget.pet1.name", "name", _SafeStr_5316.name);
            _SafeStr_4981.localizations.registerParameter("breedpets.widget.pet2.name", "name", _petData2.name);
            _SafeStr_4981.localizations.registerParameter("breedpets.widget.pet1.description", "name", _SafeStr_5316.ownerName);
            _SafeStr_4981.localizations.registerParameter("breedpets.widget.pet2.description", "name", _petData2.ownerName);
            _SafeStr_4981.localizations.registerParameter("breedpets.widget.pet1.level", "level", _SafeStr_5316.petLevel.toString());
            _SafeStr_4981.localizations.registerParameter("breedpets.widget.pet2.level", "level", _petData2.petLevel.toString());
            _SafeStr_4981.localizations.registerParameter("breedpets.widget.request", "name", _petData2.ownerName);
            if (!_window)
            {
                _window = (_windowManager.buildFromXML((_assets.getAssetByName("confirm_pet_breeding_xml").content as XML)) as _SafeStr_3263);
                addClickListener("header_button_close");
            };
            _window.center();
            _window.visible = true;
            addClickListener("save_button");
            addClickListener("cancel_button");
            enable();
            var _local_6:BitmapData = resolvePreviewImage(_SafeStr_5316.figure, "preview_image");
            updatePreviewImage(((_local_6 != null) ? _local_6 : new BitmapData(10, 10)), "preview_image");
            _local_6 = resolvePreviewImage(_petData2.figure, "preview_image2");
            updatePreviewImage(((_local_6 != null) ? _local_6 : new BitmapData(10, 10)), "preview_image2");
            var _local_4:_SafeStr_3264 = (_windowManager.buildFromXML((_assets.getAssetByName("pet_breeding_pet_preview_xml").content as XML)) as _SafeStr_3264);
            var _local_2:int = 1;
            for each (var _local_3:BreedingRarityCategoryData in _SafeStr_5997)
            {
                _SafeStr_4981.localizations.registerParameter(("breedpets.confirmation.widget.raritycategory." + _local_2), "percent", _local_3.chance.toString());
                _local_8 = (_window.findChildByName(("breeds" + _local_2)) as IItemListWindow);
                _local_8.removeListItems();
                for each (var _local_7:int in _local_3.breeds)
                {
                    _local_1 = new PetFigureData([_SafeStr_5999, _local_7].join(" "));
                    _local_5 = (_local_4.clone() as _SafeStr_3264);
                    _local_5.name = ("breed." + _local_7);
                    _local_5.bitmap = new BitmapData(_local_5.width, _local_5.height, true, 0xFFFFFF);
                    if (_local_8)
                    {
                        _local_8.addListItem(_local_5);
                    };
                    _local_6 = resolvePreviewImage(_local_1.figureString, _local_5.name, 64);
                    updatePreviewImage(((_local_6 != null) ? _local_6 : new BitmapData(25, 25, true, 0xFFFFFF)), _local_5.name);
                };
                _local_2++;
            };
            arrangeListItems();
            (_window.findChildByName("puppy.name.input") as ITextFieldWindow).setSelection(0, 0);
            _window.invalidate();
        }

        private function arrangeListItems():void
        {
            arrangeListItem("button_list");
            arrangeListItem("pet1_itemlist");
            arrangeListItem("pet2_itemlist");
            arrangeListItem("preview_list");
            arrangeListItem("element_list");
            _window.resizeToFitContent();
        }

        private function arrangeListItem(_arg_1:String):void
        {
            var _local_2:IItemListWindow = (_window.findChildByName(_arg_1) as IItemListWindow);
            if (_local_2 != null)
            {
                _local_2.arrangeListItems();
            };
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

        public function close():void
        {
            if (_window)
            {
                _window.visible = false;
            };
        }

        private function disable():void
        {
            enableElement("description", false, false);
            enableElement("request", false, false);
            enableElement("cancel_button", false, true);
            enableElement("description", false, true);
            enableElement("save_button", false, true);
        }

        public function enable():void
        {
            enableElement("description", false, false);
            enableElement("request", false, false);
            enableElement("cancel_button", true, true);
            enableElement("description", true, true);
            enableElement("save_button", true, true);
        }

        private function addClickListener(_arg_1:String):void
        {
            var _local_2:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_2 != null)
            {
                _local_2.addEventListener("WME_CLICK", onMouseClick);
            };
        }

        private function enableElement(_arg_1:String, _arg_2:Boolean, _arg_3:Boolean):void
        {
            var _local_4:_SafeStr_3109 = _window.findChildByName(_arg_1);
            if (_local_4 != null)
            {
                _local_4.visible = _arg_3;
                if (_arg_2)
                {
                    _local_4.enable();
                }
                else
                {
                    _local_4.disable();
                };
            };
        }

        private function onMouseClick(_arg_1:WindowMouseEvent):void
        {
            var _local_2:* = null;
            switch (_arg_1.target.name)
            {
                case "header_button_close":
                case "cancel_button":
                    _SafeStr_4981.cancelPetBreeding(_stuffId);
                    close();
                    return;
                case "ok_button":
                    disable();
                    return;
                case "save_button":
                    _local_2 = _window.findChildByName("puppy.name.input").caption;
                    if (_local_2.length == 0)
                    {
                        _windowManager.simpleAlert("${breedpets.confirmation.alert.title}", "${breedpets.confirmation.alert.name.required.head}", "${breedpets.confirmation.alert.name.required.desc}");
                    }
                    else
                    {
                        _SafeStr_4981.confirmPetBreeding(_stuffId, _local_2, _SafeStr_5316.webID, _petData2.webID);
                        disable();
                    };
                    return;
            };
        }


    }
}//package com.sulake.habbo.ui.widget.avatarinfo

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
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
// _SafeStr_5539 = "_-z10" (String#3398, DoABC#4)
// _SafeStr_5540 = "_-JK" (String#3926, DoABC#4)
// _SafeStr_5989 = "_-o1c" (String#2112, DoABC#4)
// _SafeStr_5997 = "_-m1K" (String#6479, DoABC#4)
// _SafeStr_5999 = "_-AZ" (String#6021, DoABC#4)
// _SafeStr_8701 = "_-u12" (String#6423, DoABC#4)
// _SafeStr_8702 = "_-H1q" (String#14548, DoABC#4)
// _SafeStr_8703 = "_-o" (String#9509, DoABC#4)
// _SafeStr_8704 = "_-vm" (String#6712, DoABC#4)
// _SafeStr_8953 = "_-d1Z" (String#24724, DoABC#4)
// _SafeStr_8954 = "_-OG" (String#30853, DoABC#4)
// _SafeStr_8959 = "_-Dr" (String#39683, DoABC#4)


