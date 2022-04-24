// by nota

//com.sulake.habbo.avatar.structure.figure.FigurePartSet

package com.sulake.habbo.avatar.structure.figure
{
    public class FigurePartSet implements _SafeStr_3177 
    {

        private var _SafeStr_4028:String;
        private var _SafeStr_3820:int;
        private var _SafeStr_3834:String;
        private var _SafeStr_3827:int;
        private var _SafeStr_5946:Boolean;
        private var _SafeStr_6910:Boolean;
        private var _SafeStr_4463:Array;
        private var _hiddenLayers:Array;
        private var _SafeStr_6911:Boolean;
        private var _SafeStr_6912:Boolean;

        public function FigurePartSet(_arg_1:XML, _arg_2:String)
        {
            var _local_3:* = null;
            var _local_5:int;
            super();
            _SafeStr_4028 = _arg_2;
            _SafeStr_3820 = parseInt(_arg_1.@id);
            _SafeStr_3834 = String(_arg_1.@gender);
            _SafeStr_3827 = parseInt(_arg_1.@club);
            _SafeStr_5946 = parseInt(_arg_1.@colorable);
            _SafeStr_6910 = parseInt(_arg_1.@selectable);
            _SafeStr_6911 = parseInt(_arg_1.@preselectable);
            _SafeStr_6912 = parseInt(_arg_1.@sellable);
            _SafeStr_4463 = [];
            _hiddenLayers = [];
            for each (var _local_4:XML in _arg_1.part)
            {
                _local_3 = new FigurePart(_local_4);
                _local_5 = indexOfPartType(_local_3);
                if (_local_5 != -1)
                {
                    _SafeStr_4463.splice(_local_5, 0, _local_3);
                }
                else
                {
                    _SafeStr_4463.push(_local_3);
                };
            };
            for each (var _local_6:XML in _arg_1.hiddenlayers.layer)
            {
                _hiddenLayers.push(String(_local_6.@parttype));
            };
        }

        public function dispose():void
        {
            for each (var _local_1:FigurePart in _SafeStr_4463)
            {
                _local_1.dispose();
            };
            _SafeStr_4463 = null;
            _hiddenLayers = null;
        }

        private function indexOfPartType(_arg_1:FigurePart):int
        {
            var _local_3:int;
            var _local_2:* = null;
            _local_3 = 0;
            while (_local_3 < _SafeStr_4463.length)
            {
                _local_2 = _SafeStr_4463[_local_3];
                if (((_local_2.type == _arg_1.type) && (_local_2.index < _arg_1.index)))
                {
                    return (_local_3);
                };
                _local_3++;
            };
            return (-1);
        }

        public function getPart(_arg_1:String, _arg_2:int):_SafeStr_3353
        {
            for each (var _local_3:FigurePart in _SafeStr_4463)
            {
                if (((_local_3.type == _arg_1) && (_local_3.id == _arg_2)))
                {
                    return (_local_3);
                };
            };
            return (null);
        }

        public function get type():String
        {
            return (_SafeStr_4028);
        }

        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get gender():String
        {
            return (_SafeStr_3834);
        }

        public function get clubLevel():int
        {
            return (_SafeStr_3827);
        }

        public function get isColorable():Boolean
        {
            return (_SafeStr_5946);
        }

        public function get isSelectable():Boolean
        {
            return (_SafeStr_6910);
        }

        public function get parts():Array
        {
            return (_SafeStr_4463);
        }

        public function get hiddenLayers():Array
        {
            return (_hiddenLayers);
        }

        public function get isPreSelectable():Boolean
        {
            return (_SafeStr_6911);
        }

        public function get isSellable():Boolean
        {
            return (_SafeStr_6912);
        }


    }
}//package com.sulake.habbo.avatar.structure.figure

// _SafeStr_3177 = "_-S1T" (String#2526, DoABC#4)
// _SafeStr_3353 = "_-Ye" (String#6452, DoABC#4)
// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_3827 = "_-81k" (String#3560, DoABC#4)
// _SafeStr_3834 = "_-tK" (String#1203, DoABC#4)
// _SafeStr_4028 = "_-81R" (String#336, DoABC#4)
// _SafeStr_4463 = "_-n1k" (String#1592, DoABC#4)
// _SafeStr_5946 = "_-j6" (String#6316, DoABC#4)
// _SafeStr_6910 = "_-I19" (String#10073, DoABC#4)
// _SafeStr_6911 = "_-i13" (String#16469, DoABC#4)
// _SafeStr_6912 = "_-Bf" (String#22466, DoABC#4)


