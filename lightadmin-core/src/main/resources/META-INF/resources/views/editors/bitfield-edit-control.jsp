<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="attributeMetadata" type="org.springframework.data.mapping.PersistentProperty" scope="request"/>

<c:forEach var="label" varStatus="loop" items="${labels}">
    <label><input type="checkbox" id="check-${label}" name="${label}" value="${loop.index}"/>${label}</label>
</c:forEach>
<input id="${attributeMetadata.name}" name="${attributeMetadata.name}" type="text" style="display: none"/>

<script type="text/javascript">

    $(function() {
        setupCheckboxes();
    });

    function setupCheckboxes() {
        var value = $("#${attributeMetadata.name}").val();
        if (value) {
            <c:forEach var="label" items="${labels}">
                var checkbox = $("#check-${label}");
                checkbox.val(Math.pow(2, checkbox.val()));
                var checkboxValue = parseInt(checkbox.val());
                var shouldBeChecked = (parseInt(value) & checkboxValue) === checkboxValue;

                if (shouldBeChecked) {
                    checkbox.prop("checked", true);
                    checkbox.parent().toggleClass("checked");
                }
            </c:forEach>
        } else {
            setTimeout(function () {
                setupCheckboxes();
            }, 50);
        }
    }

    <c:forEach var="label" items="${labels}">
        $("#check-${label}").change(function () {
            var input = $("#${attributeMetadata.name}");
            var inputValue = input.val();

            var newValue = parseInt(inputValue) + (this.checked ? 1 : -1) * this.value;

            input.val(newValue);
        });
    </c:forEach>
</script>