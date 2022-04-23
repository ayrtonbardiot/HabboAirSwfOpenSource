// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.window.utils.floorplaneditor.ImportExportDialog

package com.sulake.habbo.window.utils.floorplaneditor
{
    import com.sulake.core.window.components._SafeStr_3263;
    import _-J4._SafeStr_872;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window._SafeStr_3109;

    public class ImportExportDialog 
    {

        private var _bcFloorPlanEditor:BCFloorPlanEditor;
        private var _layout:XML;
        private var _window:_SafeStr_3263 = null;

        public function ImportExportDialog(_arg_1:BCFloorPlanEditor, _arg_2:XML)
        {
            _bcFloorPlanEditor = _arg_1;
            _layout = _arg_2;
        }

        public function set visible(_arg_1:Boolean):void
        {
            if (_window == null)
            {
                _window = _SafeStr_3263(_bcFloorPlanEditor.windowManager.buildFromXML(_layout));
                _window.center();
                _window.procedure = windowProcedure;
            };
            if (_arg_1)
            {
                _window.visible = true;
                _window.findChildByName("data").caption = _bcFloorPlanEditor.floorPlanCache.getData();
                if (((_bcFloorPlanEditor.bcSecondsLeft > 0) || (_bcFloorPlanEditor.windowManager.sessionDataManager.hasSecurity(4))))
                {
                    _window.findChildByName("save").enable();
                }
                else
                {
                    _window.findChildByName("save").disable();
                };
                _window.activate();
            }
            else
            {
                _window.visible = false;
            };
        }

        public function get visible():Boolean
        {
            if (!_window)
            {
                return (false);
            };
            return (_window.visible);
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        visible = false;
                        return;
                    case "revert":
                        _window.findChildByName("data").caption = _bcFloorPlanEditor.lastReceivedFloorPlan;
                        return;
                    case "save":
                        _bcFloorPlanEditor.windowManager.communication.connection.send(new _SafeStr_872(_window.findChildByName("data").caption, _bcFloorPlanEditor.floorPlanCache.entryPoint.x, _bcFloorPlanEditor.floorPlanCache.entryPoint.y, _bcFloorPlanEditor.floorPlanCache.entryPointDir, BCFloorPlanEditor.getThicknessSettingBySelectionIndex(_bcFloorPlanEditor.wallThickness), BCFloorPlanEditor.getThicknessSettingBySelectionIndex(_bcFloorPlanEditor.floorThickness)));
                        return;
                };
            };
        }


    }
}//package com.sulake.habbo.window.utils.floorplaneditor

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_872 = "_-7c" (String#22155, DoABC#4)


