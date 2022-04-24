// by nota

//com.sulake.habbo.avatar.common.CategoryBaseModel

package com.sulake.habbo.avatar.common
{
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.habbo.avatar.HabboAvatarEditor;
    import com.sulake.habbo.inventory._SafeStr_1708;
    import com.sulake.core.window._SafeStr_3109;

    public class CategoryBaseModel implements _SafeStr_3301 
    {

        protected var _SafeStr_3921:_SafeStr_24;
        protected var _SafeStr_4360:HabboAvatarEditor;
        protected var _SafeStr_3883:Boolean = false;
        protected var _SafeStr_3882:_SafeStr_3396;
        private var _SafeStr_4036:Boolean;

        public function CategoryBaseModel(_arg_1:HabboAvatarEditor)
        {
            _SafeStr_4360 = _arg_1;
        }

        public function dispose():void
        {
            if (_SafeStr_3882 != null)
            {
                _SafeStr_3882.dispose();
            };
            _SafeStr_3882 = null;
            _SafeStr_3921 = null;
            _SafeStr_4360 = null;
            _SafeStr_4036 = true;
        }

        public function get disposed():Boolean
        {
            return (_SafeStr_4036);
        }

        protected function init():void
        {
            if (!_SafeStr_3921)
            {
                _SafeStr_3921 = new _SafeStr_24();
            };
        }

        public function reset():void
        {
            _SafeStr_3883 = false;
            for each (var _local_1:CategoryData in _SafeStr_3921)
            {
                if (_local_1)
                {
                    _local_1.dispose();
                };
            };
            _SafeStr_3921 = new _SafeStr_24();
            if (_SafeStr_3882)
            {
                _SafeStr_3882.reset();
            };
        }

        protected function initCategory(_arg_1:String):void
        {
            var _local_3:* = null;
            var _local_2:CategoryData = _SafeStr_3921[_arg_1];
            if (_local_2 == null)
            {
                _local_3 = _SafeStr_4360.generateDataContent(this, _arg_1);
                if (_local_3)
                {
                    _SafeStr_3921[_arg_1] = _local_3;
                    updateSelectionsFromFigure(_arg_1);
                };
            };
        }

        public function switchCategory(_arg_1:String=""):void
        {
            if (!_SafeStr_3883)
            {
                init();
            };
            if (_SafeStr_3882)
            {
                _SafeStr_3882.switchCategory(_arg_1);
            };
        }

        protected function updateSelectionsFromFigure(_arg_1:String):void
        {
            if ((((!(_SafeStr_3921)) || (!(_SafeStr_4360))) || (!(_SafeStr_4360.figureData))))
            {
                return;
            };
            var _local_2:CategoryData = _SafeStr_3921[_arg_1];
            if (_local_2 == null)
            {
                return;
            };
            var _local_4:int = _SafeStr_4360.figureData.getPartSetId(_arg_1);
            var _local_3:Array = _SafeStr_4360.figureData.getColourIds(_arg_1);
            if (!_local_3)
            {
                _local_3 = [];
            };
            _local_2.selectPartId(_local_4);
            _local_2.selectColorIds(_local_3);
            if (_SafeStr_3882)
            {
                _SafeStr_3882.showPalettes(_arg_1, _local_3.length);
            };
        }

        public function hasClubItemsOverLevel(_arg_1:int):Boolean
        {
            var _local_2:Boolean;
            if (!_SafeStr_3921)
            {
                return (false);
            };
            for each (var _local_3:CategoryData in _SafeStr_3921.getValues())
            {
                if (_local_3 != null)
                {
                    _local_2 = _local_3.hasClubSelectionsOverLevel(_arg_1);
                    if (_local_2)
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function hasInvalidSellableItems(_arg_1:_SafeStr_1708):Boolean
        {
            var _local_2:Boolean;
            if (!_SafeStr_3921)
            {
                return (false);
            };
            for each (var _local_3:CategoryData in _SafeStr_3921.getValues())
            {
                if (_local_3 != null)
                {
                    _local_2 = _local_3.hasInvalidSellableItems(_arg_1);
                    if (_local_2)
                    {
                        return (true);
                    };
                };
            };
            return (false);
        }

        public function stripClubItemsOverLevel(_arg_1:int):Boolean
        {
            var _local_6:int;
            var _local_2:* = null;
            var _local_7:* = null;
            var _local_5:Boolean;
            var _local_3:* = null;
            if (!_SafeStr_3921)
            {
                return (false);
            };
            var _local_8:Array = _SafeStr_3921.getKeys();
            var _local_4:Boolean;
            _local_6 = 0;
            while (_local_6 < _local_8.length)
            {
                _local_2 = _local_8[_local_6];
                _local_7 = _SafeStr_3921[_local_2];
                _local_5 = false;
                if (_local_7.stripClubItemsOverLevel(_arg_1))
                {
                    _local_5 = true;
                };
                if (_local_7.stripClubColorsOverLevel(_arg_1))
                {
                    _local_5 = true;
                };
                if (_local_5)
                {
                    _local_3 = _local_7.getCurrentPart();
                    if (((((_local_3) && (_SafeStr_4360)) && (_SafeStr_4360.figureData)) && (_local_7)))
                    {
                        _SafeStr_4360.figureData.savePartData(_local_2, _local_3.id, _local_7.getSelectedColorIds(), true);
                    };
                    _local_4 = true;
                };
                _local_6++;
            };
            return (_local_4);
        }

        public function stripInvalidSellableItems():Boolean
        {
            var _local_5:int;
            var _local_1:* = null;
            var _local_6:* = null;
            var _local_4:Boolean;
            var _local_2:* = null;
            if (!_SafeStr_3921)
            {
                return (false);
            };
            var _local_7:Array = _SafeStr_3921.getKeys();
            var _local_3:Boolean;
            _local_5 = 0;
            while (_local_5 < _local_7.length)
            {
                _local_1 = _local_7[_local_5];
                _local_6 = _SafeStr_3921[_local_1];
                _local_4 = false;
                if (_local_6.stripInvalidSellableItems(_SafeStr_4360.manager.inventory))
                {
                    _local_4 = true;
                };
                if (_local_4)
                {
                    _local_2 = _local_6.getCurrentPart();
                    if (((((_local_2) && (_SafeStr_4360)) && (_SafeStr_4360.figureData)) && (_local_6)))
                    {
                        _SafeStr_4360.figureData.savePartData(_local_1, _local_2.id, _local_6.getSelectedColorIds(), true);
                    };
                    _local_3 = true;
                };
                _local_5++;
            };
            return (_local_3);
        }

        public function selectPart(_arg_1:String, _arg_2:int):void
        {
            var _local_3:CategoryData = _SafeStr_3921[_arg_1];
            if (_local_3 == null)
            {
                return;
            };
            var _local_5:int = _local_3.selectedPartIndex;
            _local_3.selectPartIndex(_arg_2);
            var _local_4:AvatarEditorGridPartItem = _local_3.getCurrentPart();
            if (!_local_4)
            {
                return;
            };
            if (_local_4.isDisabledForWearing)
            {
                _local_3.selectPartIndex(_local_5);
                _SafeStr_4360.openHabboClubAdWindow();
                return;
            };
            if (_SafeStr_3882)
            {
                _SafeStr_3882.showPalettes(_arg_1, _local_4.colorLayerCount);
            };
            if (((_SafeStr_4360) && (_SafeStr_4360.figureData)))
            {
                _SafeStr_4360.figureData.savePartData(_arg_1, _local_4.id, _local_3.getSelectedColorIds(), true);
            };
        }

        public function selectColor(_arg_1:String, _arg_2:int, _arg_3:int):void
        {
            var _local_6:* = null;
            var _local_5:CategoryData = _SafeStr_3921[_arg_1];
            if (_local_5 == null)
            {
                return;
            };
            var _local_4:int = _local_5.getCurrentColorIndex(_arg_3);
            _local_5.selectColorIndex(_arg_2, _arg_3);
            if (((_SafeStr_4360) && (_SafeStr_4360.figureData)))
            {
                _local_6 = _local_5.getSelectedColor(_arg_3);
                if (_local_6.isDisabledForWearing)
                {
                    _local_5.selectColorIndex(_local_4, _arg_3);
                    _SafeStr_4360.openHabboClubAdWindow();
                    return;
                };
                _SafeStr_4360.figureData.savePartSetColourId(_arg_1, _local_5.getSelectedColorIds(), true);
            };
        }

        public function get controller():HabboAvatarEditor
        {
            return (_SafeStr_4360);
        }

        public function getWindowContainer():_SafeStr_3109
        {
            if (!_SafeStr_3883)
            {
                init();
            };
            if (!_SafeStr_3882)
            {
                return (null);
            };
            return (_SafeStr_3882.getWindowContainer());
        }

        public function getCategoryData(_arg_1:String):CategoryData
        {
            if (!_SafeStr_3883)
            {
                init();
            };
            if (!_SafeStr_3921)
            {
                return (null);
            };
            return (_SafeStr_3921[_arg_1]);
        }


    }
}//package com.sulake.habbo.avatar.common

// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3396 = "_-wy" (String#6678, DoABC#4)
// _SafeStr_3882 = "_-D10" (String#53, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3921 = "_-UY" (String#870, DoABC#4)
// _SafeStr_4036 = "_-Mr" (String#290, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)


