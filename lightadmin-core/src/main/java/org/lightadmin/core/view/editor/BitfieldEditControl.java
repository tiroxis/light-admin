package org.lightadmin.core.view.editor;

import java.util.List;

public class BitfieldEditControl extends JspFragmentFieldControl {

    private final List<BitfieldEditElement> values;

    public BitfieldEditControl(List<BitfieldEditElement> values) {
        super("/views/editors/bitfield-edit-control.jsp");
        this.values = values;
    }

    @Override
    protected void prepare() {
        addAttribute("elements", values);
    }

}
