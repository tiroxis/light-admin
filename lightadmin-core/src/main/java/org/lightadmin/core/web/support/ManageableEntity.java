package org.lightadmin.core.web.support;

import com.fasterxml.jackson.annotation.JsonInclude;
import static com.fasterxml.jackson.annotation.JsonInclude.Include.NON_EMPTY;
import static com.fasterxml.jackson.annotation.JsonInclude.Include.NON_NULL;
import com.fasterxml.jackson.annotation.JsonProperty;
import static com.google.common.collect.Maps.newHashMap;
import java.io.Serializable;
import java.util.Map;
import org.springframework.hateoas.Link;

public class ManageableEntity implements Serializable {

    private String stringRepresentation;
    private boolean managedDomainType;
    private String primaryKey;
    private Object primaryKeyValue;
    private Link domainLink;
    private Map<String, Map<String, Object>> dynamicProperties;

    public ManageableEntity() {
    }

    public static ManageableEntity associatedPersistentEntity(String stringRepresentation, boolean managedDomainType, String primaryKey, Object primaryKeyValue, Link domainLink) {
        ManageableEntity entity = new ManageableEntity();
        entity.setDynamicProperties(null, stringRepresentation, domainLink, managedDomainType, primaryKey, primaryKeyValue);
        return entity;
    }

    public void setDynamicProperties(Map<String, Map<String, Object>> dynamicProperties, String stringRepresentation, Link domainLink, boolean managedDomainType, String primaryKey, Object primaryKeyValue) {
        this.stringRepresentation = stringRepresentation;
        this.domainLink = domainLink;
        this.managedDomainType = managedDomainType;
        this.dynamicProperties = dynamicProperties;
        this.primaryKey = primaryKey;
        this.primaryKeyValue = primaryKeyValue;
    }

    @JsonProperty("string_representation")
    public String getStringRepresentation() {
        return stringRepresentation;
    }

    @JsonProperty("primary_key")
    public String getPrimaryKey() {
        return primaryKey;
    }

    @JsonProperty("primary_key_value")
    public Object getPrimaryKeyValue() {
        return primaryKeyValue;
    }

    @JsonProperty("managed_type")
    public boolean isManagedDomainType() {
        return managedDomainType;
    }

    @JsonProperty("domain_link")
    @JsonInclude(NON_NULL)
    public Link getDomainLink() {
        return domainLink;
    }

    @JsonProperty("dynamic_properties")
    @JsonInclude(NON_EMPTY)
    public Map<String, Map<String, Object>> getDynamicProperties() {
        return dynamicProperties;
    }
}
