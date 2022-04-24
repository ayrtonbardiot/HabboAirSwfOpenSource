// by nota

//com.sulake.habbo.avatar.structure.figure.SetType

package com.sulake.habbo.avatar.structure.figure
{
    import com.sulake.core.utils._SafeStr_24;
    import flash.utils.Dictionary;

    public class SetType implements ISetType 
    {

        private var _SafeStr_6748:_SafeStr_24;
        private var _SafeStr_4028:String;
        private var _SafeStr_6749:int;
        private var _SafeStr_6747:Dictionary;

        public function SetType(_arg_1:XML)
        {
            _SafeStr_4028 = String(_arg_1.@type);
            _SafeStr_6749 = parseInt(_arg_1.@paletteid);
            _SafeStr_6747 = new Dictionary();
            _SafeStr_6747["F"] = [];
            _SafeStr_6747["M"] = [];
            _SafeStr_6747["F"][0] = parseInt(_arg_1.@mand_f_0);
            _SafeStr_6747["F"][1] = parseInt(_arg_1.@mand_f_1);
            _SafeStr_6747["M"][0] = parseInt(_arg_1.@mand_m_0);
            _SafeStr_6747["M"][1] = parseInt(_arg_1.@mand_m_1);
            _SafeStr_6748 = new _SafeStr_24();
            append(_arg_1);
        }

        public function dispose():void
        {
            for each (var _local_1:FigurePartSet in _SafeStr_6748.getValues())
            {
                _local_1.dispose();
            };
            _SafeStr_6748.dispose();
            _SafeStr_6748 = null;
        }

        public function cleanUp(_arg_1:XML):void
        {
            var _local_3:* = null;
            var _local_2:* = null;
            for each (var _local_4:XML in _arg_1["set"])
            {
                _local_3 = String(_local_4.@id);
                _local_2 = _SafeStr_6748.getValue(_local_3);
                if (_local_2 != null)
                {
                    _local_2.dispose();
                    _SafeStr_6748.remove(_local_3);
                };
            };
        }

        public function append(_arg_1:XML):void
        {
            for each (var _local_2:XML in _arg_1["set"])
            {
                _SafeStr_6748.add(String(_local_2.@id), new FigurePartSet(_local_2, _SafeStr_4028));
            };
        }

        public function getDefaultPartSet(_arg_1:String):_SafeStr_3177
        {
            var _local_4:int;
            var _local_2:* = null;
            var _local_3:Array = _SafeStr_6748.getKeys();
            _local_4 = (_local_3.length - 1);
            while (_local_4 >= 0)
            {
                _local_2 = _SafeStr_6748.getValue(_local_3[_local_4]);
                if ((((_local_2) && (_local_2.clubLevel == 0)) && ((_local_2.gender == _arg_1) || (_local_2.gender == "U"))))
                {
                    return (_local_2);
                };
                _local_4--;
            };
            return (null);
        }

        public function getPartSet(_arg_1:int):_SafeStr_3177
        {
            return (_SafeStr_6748.getValue(String(_arg_1)));
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get paletteID():int
        {
            return (_SafeStr_6749);
        }

        public function isMandatory(_arg_1:String, _arg_2:int):Boolean
        {
            return (_SafeStr_6747[_arg_1.toUpperCase()][Math.min(_arg_2, 1)]);
        }

        public function optionalFromClubLevel(_arg_1:String):int
        {
            var _local_2:Array = _SafeStr_6747[_arg_1.toUpperCase()];
            return (_local_2.indexOf(false));
        }

        public function get partSets():_SafeStr_24
        {
            return (_SafeStr_6748);
        }


    }
}//package com.sulake.habbo.avatar.structure.figure

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_6747 = "_-bO" (String#6815, DoABC#4)
// _SafeStr_6748 = "_-GJ" (String#5463, DoABC#4)
// _SafeStr_6749 = "_-Iv" (String#22520, DoABC#4)


