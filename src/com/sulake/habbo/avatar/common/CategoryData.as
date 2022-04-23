// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.common.CategoryData

package com.sulake.habbo.avatar.common
{
    import com.sulake.habbo.inventory._SafeStr_1708;

    public class CategoryData 
    {

        private const MAX_PALETTES:int = 2;

        private var _SafeStr_4463:Array;
        private var _SafeStr_4148:Array;
        private var _SafeStr_5565:int = -1;
        private var _SafeStr_5564:Array;

        public function CategoryData(_arg_1:Array, _arg_2:Array)
        {
            _SafeStr_4463 = _arg_1;
            _SafeStr_4148 = _arg_2;
        }

        private static function defaultColorId(_arg_1:Array, _arg_2:int):int
        {
            var _local_3:int;
            var _local_4:* = null;
            if (((!(_arg_1)) || (_arg_1.length == 0)))
            {
                return (-1);
            };
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = _arg_1[_local_3];
                if (((_local_4.partColor) && (_local_4.partColor.clubLevel <= _arg_2)))
                {
                    return (_local_4.partColor.id);
                };
                _local_3++;
            };
            return (-1);
        }


        public function dispose():void
        {
            if (_SafeStr_4463)
            {
                for each (var _local_2:AvatarEditorGridPartItem in _SafeStr_4463)
                {
                    _local_2.dispose();
                };
                _SafeStr_4463 = null;
            };
            if (_SafeStr_4148)
            {
                for each (var _local_3:Array in (_SafeStr_4148 as Array))
                {
                    if (_local_3)
                    {
                        for each (var _local_1:AvatarEditorGridColorItem in _local_3)
                        {
                            _local_1.dispose();
                        };
                    };
                };
                _SafeStr_4148 = null;
            };
            _SafeStr_5565 = -1;
            _SafeStr_5564 = null;
        }

        public function selectPartId(_arg_1:int):void
        {
            var _local_3:int;
            var _local_2:* = null;
            if (!_SafeStr_4463)
            {
                return;
            };
            _local_3 = 0;
            while (_local_3 < _SafeStr_4463.length)
            {
                _local_2 = _SafeStr_4463[_local_3];
                if (_local_2.id == _arg_1)
                {
                    selectPartIndex(_local_3);
                    return;
                };
                _local_3++;
            };
        }

        public function selectColorIds(_arg_1:Array):void
        {
            var _local_6:* = null;
            var _local_7:int;
            var _local_5:* = null;
            var _local_3:int;
            var _local_2:* = null;
            var _local_4:int;
            if (!_SafeStr_4148)
            {
                return;
            };
            if (!_arg_1)
            {
                return;
            };
            _SafeStr_5564 = new Array(_arg_1.length);
            _local_7 = 0;
            while (_local_7 < _SafeStr_4148.length)
            {
                _local_5 = getPalette(_local_7);
                if (_local_5)
                {
                    if (_arg_1.length > _local_7)
                    {
                        _local_3 = _arg_1[_local_7];
                    }
                    else
                    {
                        _local_2 = (_local_5[0] as AvatarEditorGridColorItem);
                        if (((_local_2) && (_local_2.partColor)))
                        {
                            _local_3 = _local_2.partColor.id;
                        };
                    };
                    _local_4 = 0;
                    while (_local_4 < _local_5.length)
                    {
                        _local_6 = (_local_5[_local_4] as AvatarEditorGridColorItem);
                        if (_local_6.partColor.id == _local_3)
                        {
                            _SafeStr_5564[_local_7] = _local_4;
                            _local_6.isSelected = true;
                        }
                        else
                        {
                            _local_6.isSelected = false;
                        };
                        _local_4++;
                    };
                };
                _local_7++;
            };
            updatePartColors();
        }

        public function selectPartIndex(_arg_1:int):AvatarEditorGridPartItem
        {
            var _local_2:* = null;
            var _local_3:* = null;
            if (!_SafeStr_4463)
            {
                return (null);
            };
            if (((_SafeStr_5565 >= 0) && (_SafeStr_4463.length > _SafeStr_5565)))
            {
                _local_2 = _SafeStr_4463[_SafeStr_5565];
                if (_local_2)
                {
                    _local_2.isSelected = false;
                };
            };
            if (_SafeStr_4463.length > _arg_1)
            {
                _local_3 = (_SafeStr_4463[_arg_1] as AvatarEditorGridPartItem);
                if (_local_3)
                {
                    _local_3.isSelected = true;
                    _SafeStr_5565 = _arg_1;
                    return (_local_3);
                };
            };
            return (null);
        }

        public function selectColorIndex(_arg_1:int, _arg_2:int):AvatarEditorGridColorItem
        {
            var _local_4:Array = getPalette(_arg_2);
            if (!_local_4)
            {
                return (null);
            };
            if (_local_4.length <= _arg_1)
            {
                return (null);
            };
            deselectColorIndex(_SafeStr_5564[_arg_2], _arg_2);
            _SafeStr_5564[_arg_2] = _arg_1;
            var _local_3:AvatarEditorGridColorItem = (_local_4[_arg_1] as AvatarEditorGridColorItem);
            if (!_local_3)
            {
                return (null);
            };
            _local_3.isSelected = true;
            updatePartColors();
            return (_local_3);
        }

        public function getCurrentColorIndex(_arg_1:int):int
        {
            return (_SafeStr_5564[_arg_1]);
        }

        private function deselectColorIndex(_arg_1:int, _arg_2:int):void
        {
            var _local_4:Array = getPalette(_arg_2);
            if (!_local_4)
            {
                return;
            };
            if (_local_4.length <= _arg_1)
            {
                return;
            };
            var _local_3:AvatarEditorGridColorItem = (_local_4[_arg_1] as AvatarEditorGridColorItem);
            if (!_local_3)
            {
                return;
            };
            _local_3.isSelected = false;
        }

        public function getSelectedColorIds():Array
        {
            var _local_8:int;
            var _local_7:* = null;
            var _local_5:* = null;
            if (((!(_SafeStr_5564)) || (_SafeStr_5564.length == 0)))
            {
                return (null);
            };
            if (((!(_SafeStr_4148)) || (_SafeStr_4148.length == 0)))
            {
                return (null);
            };
            var _local_4:Array = (_SafeStr_4148[0] as Array);
            if (((!(_local_4)) || (_local_4.length == 0)))
            {
                return (null);
            };
            var _local_3:AvatarEditorGridColorItem = (_local_4[0] as AvatarEditorGridColorItem);
            if (((!(_local_3)) || (!(_local_3.partColor))))
            {
                return (null);
            };
            var _local_1:int = _local_3.partColor.id;
            var _local_2:Array = [];
            _local_8 = 0;
            while (_local_8 < _SafeStr_5564.length)
            {
                _local_7 = _SafeStr_4148[_local_8];
                if (!((!(_local_7)) || (_local_7.length <= _local_8)))
                {
                    if (_local_7.length > _SafeStr_5564[_local_8])
                    {
                        _local_5 = (_local_7[_SafeStr_5564[_local_8]] as AvatarEditorGridColorItem);
                        if (((_local_5) && (_local_5.partColor)))
                        {
                            _local_2.push(_local_5.partColor.id);
                        }
                        else
                        {
                            _local_2.push(_local_1);
                        };
                    }
                    else
                    {
                        _local_2.push(_local_1);
                    };
                };
                _local_8++;
            };
            var _local_6:AvatarEditorGridPartItem = getCurrentPart();
            if (!_local_6)
            {
                return (null);
            };
            return (_local_2.slice(0, Math.max(_local_6.colorLayerCount, 1)));
        }

        private function getSelectedColors():Array
        {
            var _local_3:* = null;
            var _local_2:int;
            var _local_1:Array = [];
            _local_2 = 0;
            while (_local_2 < _SafeStr_5564.length)
            {
                _local_3 = getSelectedColor(_local_2);
                if (_local_3)
                {
                    _local_1.push(_local_3.partColor);
                }
                else
                {
                    _local_1.push(null);
                };
                _local_2++;
            };
            return (_local_1);
        }

        public function getSelectedColor(_arg_1:int):AvatarEditorGridColorItem
        {
            var _local_2:Array = getPalette(_arg_1);
            if (((!(_local_2)) || (_local_2.length <= _SafeStr_5564[_arg_1])))
            {
                return (null);
            };
            return (_local_2[_SafeStr_5564[_arg_1]] as AvatarEditorGridColorItem);
        }

        public function getCurrentColorId(_arg_1:int):int
        {
            var _local_2:AvatarEditorGridColorItem = getSelectedColor(_arg_1);
            if (((_local_2) && (_local_2.partColor)))
            {
                return (_local_2.partColor.id);
            };
            return (0);
        }

        public function get parts():Array
        {
            return (_SafeStr_4463);
        }

        public function getPalette(_arg_1:int):Array
        {
            if (!_SafeStr_5564)
            {
                return (null);
            };
            if (!_SafeStr_4148)
            {
                return (null);
            };
            if (_SafeStr_4148.length <= _arg_1)
            {
                return (null);
            };
            return (_SafeStr_4148[_arg_1] as Array);
        }

        public function getCurrentPart():AvatarEditorGridPartItem
        {
            return (_SafeStr_4463[_SafeStr_5565] as AvatarEditorGridPartItem);
        }

        private function updatePartColors():void
        {
            var _local_2:Array = getSelectedColors();
            for each (var _local_1:AvatarEditorGridPartItem in _SafeStr_4463)
            {
                if (_local_1)
                {
                    _local_1.colors = _local_2;
                };
            };
        }

        public function hasClubSelectionsOverLevel(_arg_1:int):Boolean
        {
            var _local_6:int;
            var _local_8:* = null;
            var _local_2:* = null;
            var _local_5:Boolean;
            var _local_7:Array = getSelectedColors();
            if (_local_7)
            {
                _local_6 = 0;
                while (_local_6 < _local_7.length)
                {
                    _local_8 = _local_7[_local_6];
                    if (((!(_local_8 == null)) && (_local_8.clubLevel > _arg_1)))
                    {
                        _local_5 = true;
                    };
                    _local_6++;
                };
            };
            var _local_3:Boolean;
            var _local_4:AvatarEditorGridPartItem = getCurrentPart();
            if (((!(_local_4 == null)) && (_local_4.partSet)))
            {
                _local_2 = _local_4.partSet;
                if (((!(_local_2 == null)) && (_local_2.clubLevel > _arg_1)))
                {
                    _local_3 = true;
                };
            };
            return ((_local_5) || (_local_3));
        }

        public function hasInvalidSellableItems(_arg_1:_SafeStr_1708):Boolean
        {
            var _local_2:* = null;
            var _local_3:Boolean;
            var _local_4:AvatarEditorGridPartItem = getCurrentPart();
            if (((!(_local_4 == null)) && (_local_4.partSet)))
            {
                _local_2 = _local_4.partSet;
                if ((((!(_local_2 == null)) && (_local_2.isSellable)) && (!(_arg_1.hasFigureSetIdInInventory(_local_2.id)))))
                {
                    _local_3 = true;
                };
            };
            return (_local_3);
        }

        public function stripClubItemsOverLevel(_arg_1:int):Boolean
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_4:AvatarEditorGridPartItem = getCurrentPart();
            if (((_local_4) && (_local_4.partSet)))
            {
                _local_3 = _local_4.partSet;
                if (_local_3.clubLevel > _arg_1)
                {
                    _local_2 = selectPartIndex(0);
                    if (((!(_local_2 == null)) && (_local_2.partSet == null)))
                    {
                        selectPartIndex(1);
                    };
                    return (true);
                };
            };
            return (false);
        }

        public function stripClubColorsOverLevel(_arg_1:int):Boolean
        {
            var _local_5:int;
            var _local_8:* = null;
            var _local_4:Array = [];
            var _local_7:Array = getSelectedColors();
            var _local_2:Boolean;
            var _local_6:Array = getPalette(0);
            var _local_3:int = defaultColorId(_local_6, _arg_1);
            if (_local_3 == -1)
            {
                return (false);
            };
            _local_5 = 0;
            while (_local_5 < _local_7.length)
            {
                _local_8 = _local_7[_local_5];
                if (_local_8 == null)
                {
                    _local_4.push(_local_3);
                    _local_2 = true;
                }
                else
                {
                    if (_local_8.clubLevel > _arg_1)
                    {
                        _local_4.push(_local_3);
                        _local_2 = true;
                    }
                    else
                    {
                        _local_4.push(_local_8.id);
                    };
                };
                _local_5++;
            };
            if (_local_2)
            {
                selectColorIds(_local_4);
            };
            return (_local_2);
        }

        public function stripInvalidSellableItems(_arg_1:_SafeStr_1708):Boolean
        {
            var _local_3:* = null;
            var _local_2:* = null;
            var _local_4:AvatarEditorGridPartItem = getCurrentPart();
            if (((_local_4) && (_local_4.partSet)))
            {
                _local_3 = _local_4.partSet;
                if (((_local_3.isSellable) && (!(_arg_1.hasFigureSetIdInInventory(_local_3.id)))))
                {
                    _local_2 = selectPartIndex(0);
                    if (((!(_local_2 == null)) && (_local_2.partSet == null)))
                    {
                        selectPartIndex(1);
                    };
                    return (true);
                };
            };
            return (false);
        }

        public function get selectedPartIndex():int
        {
            return (_SafeStr_5565);
        }


    }
}//package com.sulake.habbo.avatar.common

// _SafeStr_1708 = "_-Nb" (String#2308, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_4148 = "_-71G" (String#2477, DoABC#4)
// _SafeStr_4463 = "_-n1k" (String#1592, DoABC#4)
// _SafeStr_5564 = "_-118" (String#4163, DoABC#4)
// _SafeStr_5565 = "_-71u" (String#7446, DoABC#4)


