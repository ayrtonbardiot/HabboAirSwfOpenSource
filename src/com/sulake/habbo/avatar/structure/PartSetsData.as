// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.avatar.structure.PartSetsData

package com.sulake.habbo.avatar.structure
{
    import flash.utils.Dictionary;
    import com.sulake.habbo.avatar.structure.parts.PartDefinition;
    import com.sulake.habbo.avatar.structure.parts.ActivePartSet;
    import com.sulake.habbo.avatar.actions.IActionDefinition;
    import com.sulake.habbo.avatar.actions.ActionDefinition;
    import com.sulake.habbo.avatar.structure.parts.*;

    public class PartSetsData implements IStructureData 
    {

        private var _SafeStr_4463:Dictionary;
        private var _SafeStr_6091:Dictionary;

        public function PartSetsData()
        {
            _SafeStr_4463 = new Dictionary();
            _SafeStr_6091 = new Dictionary();
        }

        public function parse(_arg_1:XML):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            for each (var _local_3:XML in _arg_1.partSet[0].part)
            {
                _SafeStr_4463[String(_local_3.@["set-type"])] = new PartDefinition(_local_3);
            };
            for each (var _local_2:XML in _arg_1.activePartSet)
            {
                _SafeStr_6091[String(_local_2.@id)] = new ActivePartSet(_local_2);
            };
            return (true);
        }

        public function appendXML(_arg_1:XML):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            for each (var _local_3:XML in _arg_1.partSet[0].part)
            {
                _SafeStr_4463[String(_local_3.@["set-type"])] = new PartDefinition(_local_3);
            };
            for each (var _local_2:XML in _arg_1.activePartSet)
            {
                _SafeStr_6091[String(_local_2.@id)] = new ActivePartSet(_local_2);
            };
            return (false);
        }

        public function getActiveParts(_arg_1:IActionDefinition):Array
        {
            var _local_2:ActivePartSet = _SafeStr_6091[_arg_1.activePartSet];
            if (_local_2 != null)
            {
                return (_local_2.parts);
            };
            return ([]);
        }

        public function getPartDefinition(_arg_1:String):PartDefinition
        {
            return (_SafeStr_4463[_arg_1] as PartDefinition);
        }

        public function addPartDefinition(_arg_1:XML):PartDefinition
        {
            var _local_2:String = String(_arg_1.@["set-type"]);
            if (_SafeStr_4463[_local_2] == null)
            {
                _SafeStr_4463[_local_2] = new PartDefinition(_arg_1);
            };
            return (_SafeStr_4463[_local_2]);
        }

        public function get parts():Dictionary
        {
            return (_SafeStr_4463);
        }

        public function get activePartSets():Dictionary
        {
            return (_SafeStr_6091);
        }

        public function getActivePartSet(_arg_1:ActionDefinition):ActivePartSet
        {
            return (_SafeStr_6091[_arg_1.activePartSet] as ActivePartSet);
        }


    }
}//package com.sulake.habbo.avatar.structure

// _SafeStr_4463 = "_-n1k" (String#1592, DoABC#4)
// _SafeStr_6091 = "_-v14" (String#10131, DoABC#4)


