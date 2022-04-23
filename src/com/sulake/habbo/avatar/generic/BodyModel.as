// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.generic.BodyModel

package com.sulake.habbo.avatar.generic
{
    import com.sulake.habbo.avatar.common.CategoryBaseModel;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.habbo.avatar._SafeStr_1875;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.avatar.common.CategoryData;
    import com.sulake.habbo.avatar.common.AvatarEditorGridColorItem;
    import com.sulake.habbo.avatar.common.AvatarEditorGridPartItem;

    public class BodyModel extends CategoryBaseModel implements _SafeStr_3301, _SafeStr_1875 
    {

        public function BodyModel(_arg_1:HabboAvatarEditor)
        {
            super(_arg_1);
        }

        override protected function init():void
        {
            super.init();
            initCategory("hd");
            _SafeStr_3883 = true;
            if (!_SafeStr_3882)
            {
                _SafeStr_3882 = new BodyView(this);
                if (_SafeStr_3882)
                {
                    _SafeStr_3882.init();
                };
            };
        }

        override public function switchCategory(_arg_1:String=""):void
        {
            _SafeStr_3882.switchCategory(_arg_1);
        }

        override public function selectColor(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
            var _local_4:CategoryData = _SafeStr_3921[_arg_1];
            if (_local_4 == null)
            {
                return;
            };
            _local_4.selectColorIndex(_arg_2, _arg_3);
            var _local_5:AvatarEditorGridColorItem = _local_4.getSelectedColor(_arg_3);
            if (_local_5.isDisabledForWearing)
            {
                _SafeStr_4360.openHabboClubAdWindow();
                return;
            };
            _SafeStr_4360.figureData.savePartSetColourId(_arg_1, _local_4.getSelectedColorIds(), true);
            updateSelectionsFromFigure("hd");
        }

        override protected function updateSelectionsFromFigure(_arg_1:String):void
        {
            var _local_2:CategoryData = getFaceCategoryData();
            if (!_local_2)
            {
                return;
            };
            updateIconImage(_local_2);
        }

        private function getFaceCategoryData():CategoryData
        {
            if (!_SafeStr_3921)
            {
                return (null);
            };
            var _local_1:CategoryData = _SafeStr_3921["hd"];
            if (_local_1 == null)
            {
                return (null);
            };
            var _local_3:int = _SafeStr_4360.figureData.getPartSetId("hd");
            var _local_2:Array = _SafeStr_4360.figureData.getColourIds("hd");
            _local_1.selectPartId(_local_3);
            _local_1.selectColorIds(_local_2);
            return (_local_1);
        }

        private function updateIconImage(_arg_1:CategoryData, _arg_2:String=null):void
        {
            var _local_5:* = null;
            var _local_4:* = null;
            for each (var _local_3:AvatarEditorGridPartItem in _arg_1.parts)
            {
                if (_local_3.partSet)
                {
                    _local_5 = _SafeStr_4360.figureData.getFigureStringWithFace(_local_3.id);
                    if (((_arg_2 == null) || (_arg_2 == _local_5)))
                    {
                        _local_4 = _SafeStr_4360.manager.avatarRenderManager.createAvatarImage(_local_5, "h", null, this);
                        _local_3.iconImage = _local_4.getCroppedImage("head");
                        _local_4.dispose();
                    };
                };
            };
        }

        public function avatarImageReady(_arg_1:String):void
        {
            var _local_2:CategoryData = getFaceCategoryData();
            if (!_local_2)
            {
                return;
            };
            updateIconImage(_local_2, _arg_1);
        }


    }
}//package com.sulake.habbo.avatar.generic

// _SafeStr_1875 = "_-R1S" (String#2190, DoABC#4)
// _SafeStr_3138 = "_-L1S" (String#1270, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3921 = "_-UY" (String#870, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)


