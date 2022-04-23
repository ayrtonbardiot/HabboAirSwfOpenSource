// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.pets.PetFigureData

package com.sulake.habbo.avatar.pets
{
    public class PetFigureData 
    {

        private var _SafeStr_4042:int;
        private var _SafeStr_4043:int;
        private var _color:int;
        private var _SafeStr_4038:Array;
        private var _SafeStr_4039:Array;
        private var _SafeStr_4040:Array;
        private var _SafeStr_4041:Array;
        private var _headOnly:Boolean;

        public function PetFigureData(_arg_1:String)
        {
            var _local_2:int;
            super();
            _SafeStr_4042 = getTypeId(_arg_1);
            _SafeStr_4043 = getPaletteId(_arg_1);
            _color = getColor(_arg_1);
            _headOnly = getHeadOnly(_arg_1);
            var _local_3:Array = getCustomData(_arg_1);
            _SafeStr_4039 = getCustomLayerIds(_local_3);
            _SafeStr_4040 = getCustomPartIds(_local_3);
            _SafeStr_4041 = getCustomPaletteIds(_local_3);
            _SafeStr_4038 = [];
            _local_2 = 0;
            while (_local_2 < _SafeStr_4039.length)
            {
                _SafeStr_4038.push(new PetCustomPart(_SafeStr_4039[_local_2], _SafeStr_4040[_local_2], _SafeStr_4041[_local_2]));
                _local_2++;
            };
        }

        public function get typeId():int
        {
            return (_SafeStr_4042);
        }

        public function get paletteId():int
        {
            return (_SafeStr_4043);
        }

        public function get color():int
        {
            return (_color);
        }

        public function get customLayerIds():Array
        {
            return (_SafeStr_4039);
        }

        public function get customPartIds():Array
        {
            return (_SafeStr_4040);
        }

        public function get customPaletteIds():Array
        {
            return (_SafeStr_4041);
        }

        public function get customParts():Array
        {
            return (_SafeStr_4038);
        }

        public function getCustomPart(_arg_1:int):PetCustomPart
        {
            if (_SafeStr_4038 != null)
            {
                for each (var _local_2:PetCustomPart in _SafeStr_4038)
                {
                    if (_local_2.layerId == _arg_1)
                    {
                        return (_local_2);
                    };
                };
            };
            return (null);
        }

        public function get hasCustomParts():Boolean
        {
            return ((!(_SafeStr_4039 == null)) && (_SafeStr_4039.length > 0));
        }

        public function get headOnly():Boolean
        {
            return (_headOnly);
        }

        public function get figureString():String
        {
            var _local_2:String = ((((typeId + " ") + paletteId) + " ") + color.toString(16));
            _local_2 = (_local_2 + (" " + customParts.length));
            for each (var _local_1:PetCustomPart in customParts)
            {
                _local_2 = (_local_2 + (((((" " + _local_1.layerId) + " ") + _local_1.partId) + " ") + _local_1.paletteId));
            };
            return (_local_2);
        }

        private function getCustomData(_arg_1:String):Array
        {
            var _local_7:* = null;
            var _local_4:int;
            var _local_5:int;
            var _local_2:int;
            var _local_6:int;
            var _local_3:Array = [];
            if (_arg_1 != null)
            {
                _local_7 = _arg_1.split(" ");
                _local_4 = ((_headOnly) ? 1 : 0);
                _local_5 = (4 + _local_4);
                if (_local_7.length > _local_5)
                {
                    _local_2 = (3 + _local_4);
                    _local_6 = parseInt(_local_7[_local_2]);
                    _local_3 = _local_7.slice(_local_5, (_local_5 + (_local_6 * 3)));
                };
            };
            return (_local_3);
        }

        private function getCustomLayerIds(_arg_1:Array):Array
        {
            var _local_3:int;
            var _local_2:Array = [];
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_2.push(parseInt(_arg_1[(_local_3 + 0)]));
                _local_3 = (_local_3 + 3);
            };
            return (_local_2);
        }

        private function getCustomPartIds(_arg_1:Array):Array
        {
            var _local_3:int;
            var _local_2:Array = [];
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_2.push(parseInt(_arg_1[(_local_3 + 1)]));
                _local_3 = (_local_3 + 3);
            };
            return (_local_2);
        }

        private function getCustomPaletteIds(_arg_1:Array):Array
        {
            var _local_3:int;
            var _local_2:Array = [];
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_2.push(parseInt(_arg_1[(_local_3 + 2)]));
                _local_3 = (_local_3 + 3);
            };
            return (_local_2);
        }

        private function getTypeId(_arg_1:String):int
        {
            var _local_2:* = null;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1.split(" ");
                if (_local_2.length >= 1)
                {
                    return (parseInt(_local_2[0]));
                };
            };
            return (0);
        }

        private function getPaletteId(_arg_1:String):int
        {
            var _local_2:* = null;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1.split(" ");
                if (_local_2.length >= 2)
                {
                    return (parseInt(_local_2[1]));
                };
            };
            return (0);
        }

        private function getColor(_arg_1:String):int
        {
            var _local_2:* = null;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1.split(" ");
                if (_local_2.length >= 3)
                {
                    return (parseInt(_local_2[2], 16));
                };
            };
            return (0xFFFFFF);
        }

        private function getHeadOnly(_arg_1:String):Boolean
        {
            var _local_2:* = null;
            if (_arg_1 != null)
            {
                _local_2 = _arg_1.split(" ");
                if (_local_2.length >= 4)
                {
                    return (_local_2[3] == "head");
                };
            };
            return (false);
        }


    }
}//package com.sulake.habbo.avatar.pets

// _SafeStr_4038 = "_-N1U" (String#10333, DoABC#4)
// _SafeStr_4039 = "_-E1a" (String#5496, DoABC#4)
// _SafeStr_4040 = "_-Ws" (String#6864, DoABC#4)
// _SafeStr_4041 = "_-i1E" (String#6834, DoABC#4)
// _SafeStr_4042 = "_-L1L" (String#4000, DoABC#4)
// _SafeStr_4043 = "_-Ru" (String#7421, DoABC#4)


