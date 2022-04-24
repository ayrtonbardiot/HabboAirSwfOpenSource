// by nota

//com.sulake.habbo.avatar.structure.FigureSetData

package com.sulake.habbo.avatar.structure
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.figure.Palette;
    import com.sulake.habbo.avatar.structure.figure.SetType;
    import com.sulake.habbo.avatar.structure.figure._SafeStr_3177;
    import com.sulake.habbo.avatar.structure.figure.ISetType;
    import com.sulake.habbo.avatar.structure.figure._SafeStr_3202;
    import com.sulake.habbo.avatar.structure.figure.*;

    public class FigureSetData implements IStructureData, _SafeStr_3125 
    {

        private var _SafeStr_4148:Dictionary;
        private var _SafeStr_5646:Dictionary;

        public function FigureSetData()
        {
            _SafeStr_4148 = new Dictionary();
            _SafeStr_5646 = new Dictionary();
        }

        public function dispose():void
        {
        }

        public function parse(_arg_1:XML):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            for each (var _local_2:XML in _arg_1.colors.palette)
            {
                _SafeStr_4148[String(_local_2.@id)] = new Palette(_local_2);
            };
            for each (var _local_3:XML in _arg_1.sets.settype)
            {
                _SafeStr_5646[String(_local_3.@type)] = new SetType(_local_3);
            };
            return (true);
        }

        public function injectXML(_arg_1:XML):void
        {
            var _local_2:* = null;
            for each (var _local_3:XML in _arg_1.sets.settype)
            {
                _local_2 = _SafeStr_5646[String(_local_3.@type)];
                if (_local_2 != null)
                {
                    _local_2.cleanUp(_local_3);
                }
                else
                {
                    _SafeStr_5646[String(_local_3.@type)] = new SetType(_local_3);
                };
            };
            appendXML(_arg_1);
        }

        public function appendXML(_arg_1:XML):Boolean
        {
            var _local_3:* = null;
            var _local_4:* = null;
            if (_arg_1 == null)
            {
                return (false);
            };
            for each (var _local_2:XML in _arg_1.colors.palette)
            {
                _local_3 = _SafeStr_4148[String(_local_2.@id)];
                if (_local_3 == null)
                {
                    _SafeStr_4148[String(_local_2.@id)] = new Palette(_local_2);
                }
                else
                {
                    _local_3.append(_local_2);
                };
            };
            for each (var _local_5:XML in _arg_1.sets.settype)
            {
                _local_4 = _SafeStr_5646[String(_local_5.@type)];
                if (_local_4 == null)
                {
                    _SafeStr_5646[String(_local_5.@type)] = new SetType(_local_5);
                }
                else
                {
                    _local_4.append(_local_5);
                };
            };
            return (false);
        }

        public function getMandatorySetTypeIds(_arg_1:String, _arg_2:int):Array
        {
            var _local_3:Array = [];
            for each (var _local_4:SetType in _SafeStr_5646)
            {
                if (((_local_4) && (_local_4.isMandatory(_arg_1, _arg_2))))
                {
                    _local_3.push(_local_4.type);
                };
            };
            return (_local_3);
        }

        public function getDefaultPartSet(_arg_1:String, _arg_2:String):_SafeStr_3177
        {
            var _local_3:SetType = (_SafeStr_5646[_arg_1] as SetType);
            if (_local_3)
            {
                return (_local_3.getDefaultPartSet(_arg_2));
            };
            return (null);
        }

        public function getSetType(_arg_1:String):ISetType
        {
            return (_SafeStr_5646[_arg_1]);
        }

        public function getPalette(_arg_1:int):_SafeStr_3202
        {
            return (_SafeStr_4148[String(_arg_1)]);
        }

        public function getFigurePartSet(_arg_1:int):_SafeStr_3177
        {
            var _local_2:* = null;
            for each (var _local_3:SetType in _SafeStr_5646)
            {
                _local_2 = _local_3.getPartSet(_arg_1);
                if (_local_2 != null)
                {
                    return (_local_2);
                };
            };
            return (null);
        }


    }
}//package com.sulake.habbo.avatar.structure

// _SafeStr_3125 = "_-u1g" (String#5880, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_3202 = "_-P1H" (String#6065, DoABC#4)
// _SafeStr_4148 = "_-71G" (String#2477, DoABC#4)
// _SafeStr_5646 = "_-l" (String#6495, DoABC#4)


